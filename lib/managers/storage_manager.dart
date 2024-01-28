import 'dart:convert';

import 'package:chat/repository/get_it/get_it_initializer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storageManager = getIt<StorageManager>();

class StorageManager {
  final _sharedPreferences = getIt<SharedPreferences>();

  Future<List<RemoteMessage>> getBackgroundMessageQueue() async {
    await _sharedPreferences.reload();
    final queue = _sharedPreferences.getStringList('background_message_queue') ?? [];
    final messages = queue.map((e) => RemoteMessage.fromMap(jsonDecode(e))).toList();
    return messages;
  }

  Future<void> addBackgroundMessageInQueue(RemoteMessage remoteMessage) async {
    await _sharedPreferences.reload();
    final queue = _sharedPreferences.getStringList('background_message_queue') ?? [];
    queue.add(jsonEncode(remoteMessage.toMap()));
    await _sharedPreferences.setStringList('background_message_queue', queue);
  }

  Future<void> clearBackgroundMessageQueue() async {
    await _sharedPreferences.reload();
    await _sharedPreferences.setStringList('background_message_queue', []);
  }
}
