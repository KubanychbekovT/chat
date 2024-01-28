import 'package:chat/application/user/profile_manager.dart';
import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/domain/chat/message/message.dart';
import 'package:chat/repository/core/dio_client.dart';
import 'package:dio/dio.dart';

final notificationManager = NotificationManager();

class NotificationManager {
  static const _serverKey =
      'AAAAkzMcOU0:APA91bGQLdCd1zUvkMKt96fbrgytc71vq9caLO9eWmqB1GdSDxSOeaDFYa-yw4fxi5anX3G_Xzz8d0EoOY5r4FHxH0PaDilPoM-4tiLzKMKnajcRQZDRvaSsh8fsS_RKzm2Ac23VJVFQ';

  Future<void> sendNotification(Chat chat, Message message) async {
    final currentUser = profileManager.user;
    if (currentUser?.fcmToken == null) return;
    dio.post(
      'https://fcm.googleapis.com/fcm/send',
      data: {
        "to": chat.withUser!.fcmToken,
        "notification": {
          "title": currentUser!.name,
          "body": message.text,
          "mutable_content": false,
        },
        "data": {
          "chatId": chat.reference.id,
          "sender": message.sender,
          "text": message.text,
          "hasRead": message.hasRead,
        }
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_serverKey",
        },
      ),
    );
  }
}
