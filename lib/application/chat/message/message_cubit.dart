import 'package:bloc/bloc.dart';
import 'package:chat/domain/message/message_request.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_state.dart';
part 'message_cubit.freezed.dart';


class MessageCubit extends Cubit<MessageState> {
  final Dio dio;

  MessageCubit(this.dio) : super(MessageState.initial());

  Future<void> fetchMessages() async {
    emit(const MessageState.loading());

    try {
      final response = await dio.get('');
      final messages = (response.data['messages'] as List<dynamic>)
          .map((data) =>
          MessageRequest(content: data['content'] ?? '',
              createdAt: data['createdAt'] ?? '',
              fileDataIds: List<String>.from(data['fileDataIds']),
              isRead: data['isRead'] ?? '',
              messageType: data['messageType'] ?? '',
              recipient: data['recipient'] ?? '',
              sender: data['sender'] ?? ''))
      .toList();

      emit(MessageState.loaded(messages));
    } catch (e) {
      emit(MessageState.error('Failed to fetch messages'));
    }
  }
}
