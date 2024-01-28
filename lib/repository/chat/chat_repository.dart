import 'package:chat/application/notification_manager/notification_manager.dart';
import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/domain/chat/message/message.dart';
import 'package:chat/managers/chat_manager.dart';
import 'package:chat/presentation/core/utils/firebase_helper.dart';
import 'package:chat/repository/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRepository {
  final _firestore = FirebaseFirestore.instance;

  ChatRepository();

  Future<List<Chat>> getAllChats() async {
    final chats = <Chat>[];
    await _firestore
        .collection('chats')
        .where(
          'participants',
          arrayContains: FirebaseHelper.currentUser.uid,
        )
        .get()
        .then((value) {
      for (var element in value.docs) {
        chats.add(Chat.fromFirestore(element));
      }
    });
    for (int i = 0; i < chats.length; i++) {
      final withUserId = (chats[i].participants.toList()
            ..remove(
              FirebaseHelper.currentUser.uid,
            ))
          .first;
      final withUser = await UserRepository().getUser(withUserId);
      chats[i] = chats[i].copyWith(withUser: withUser);
    }
    return chats;
  }

  Future<void> sendMessage(Chat chat, String text) async {
    final message = Message(
      text: text,
      sender: FirebaseHelper.currentUser.uid,
      createdAt: DateTime.now().toUtc(),
      hasRead: false,
    );
    chatsManager.addNewMessage(chatReference: chat.reference, message: message);
    await chat.reference.update({
      'messages': FieldValue.arrayUnion([message.toJson()]),
    });
    notificationManager.sendNotification(chat, message).ignore();
  }

// Future<void> sendMessage(MessageRequest message) async {
//   try {
//     final response = await _dio.post(
//       'https://chatapp.tw1.ru/chat/allMessages',
//     );
//
//     print('Success: ${response.data}');
//   } catch (error) {
//     print('Error: $error');
//     throw error;
//   }
// }
}
