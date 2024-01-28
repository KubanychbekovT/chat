import 'dart:async';

import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/domain/chat/message/message.dart';
import 'package:chat/firebase_options.dart';
import 'package:chat/managers/storage_manager.dart';
import 'package:chat/presentation/core/utils/firebase_helper.dart';
import 'package:chat/repository/get_it/get_it_initializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

ChatManager get chatsManager => getIt<ChatManager>();

Future<void> backgroundMessageHandler(RemoteMessage remoteMessage) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getItSetUp();
  await storageManager.addBackgroundMessageInQueue(remoteMessage);
}

class ChatManager {
  // static final ChatManager _singleton = ChatManager._internal();
  //
  // factory ChatManager() {
  //   return _singleton;
  // }
  //
  // ChatManager._internal();

  List<Chat> chats = [];
  final StreamController<void> _newMessageNotifierController = StreamController.broadcast();
  StreamSubscription? _firebaseMessagingSubscription;

  Stream<void> get newMessageNotifierStream => _newMessageNotifierController.stream;

  void init() {
    chats = [];
    _firebaseMessagingSubscription?.cancel();
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

    _firebaseMessagingSubscription = FirebaseMessaging.onMessage.listen(_newMessageHandler);
  }

  Future<void> checkBackgroundQueue() async {
    final messages = await storageManager.getBackgroundMessageQueue();
    for (final message in messages) {
      _newMessageHandler(message);
    }
    await storageManager.clearBackgroundMessageQueue();
  }

  void addNewMessage({required DocumentReference chatReference, required Message message}) {
    for (int i = 0; i < chats.length; i++) {
      if (chats[i].reference == chatReference) {
        chats[i] = chats[i].copyWith(messages: [...chats[i].messages, message]);
        _newMessageNotifierController.add(null);
        break;
      }
    }
  }

  void _newMessageHandler(RemoteMessage remoteMessage) {
    final chatId = remoteMessage.data['chatId'];
    final chatReference = FirebaseHelper.chatCollection.doc(chatId);

    final message = Message.fromRemoteMessage(remoteMessage);
    addNewMessage(chatReference: chatReference, message: message);
  }
}
