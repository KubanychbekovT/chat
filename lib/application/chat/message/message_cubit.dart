import 'package:bloc/bloc.dart';
import 'package:chat/domain/group/group.dart';
import 'package:chat/domain/group/group_request.dart';
import 'package:chat/domain/message/message_request.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_cubit.freezed.dart';
part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final Dio dio;
  List<MessageRequest> _messages = [];

  MessageCubit(this.dio) : super(MessageState.initial());

  Future<void> fetchMessages() async {
    emit(const MessageState.loading());

    try {
      final response = await dio.get('');
      final messages = (response.data['messages'] as List<dynamic>)
          .map((data) => MessageRequest.fromJson(data))
          .toList();

      _messages = messages;
      emit(MessageState.loaded(_messages));
    } catch (e) {
      emit(MessageState.error('Failed to fetch messages'));
    }
  }

  Future<void> sendMessage(MessageRequest message) async {
    try {
      _messages.add(message);
      emit(MessageState.loaded(_messages));
    } catch (e) {
      emit(MessageState.error('Failed to send message'));
    }
  }


  Future<void> createGroup(GroupRequest groupRequest) async {
    try {
      final response = await dio.post(
        'https://your_api_url.com/chat/createGroup',
        data: groupRequest.toJson(),
      );

      final group = Group.fromJson(response.data);
      emit(MessageState.groupCreated(group));
    } catch (e) {
      emit(MessageState.error('Failed to create group'));
    }
  }
}

