import 'package:chat/domain/message/message_request.dart';
import 'package:dio/dio.dart';

class ChatRepository {
  final Dio _dio;

  ChatRepository(this._dio);

  Future<void> sendMessage(MessageRequest message) async {
    try {
      final response = await _dio.post(
        '/chat/allMessages',
      );

      print('Success: ${response.data}');
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}