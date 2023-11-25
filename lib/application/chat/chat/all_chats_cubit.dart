import 'package:bloc/bloc.dart';
import 'package:chat/domain/chat/all_chats.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'all_chats_state.dart';
part 'all_chats_cubit.freezed.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState.initial());

  Future<void> getAllChats() async {
    emit(const ChatState.loading());
    try {
      final response = await Dio().get('https://chatapp.tw1.ru/chat/getAllChats');
      final List<dynamic> data = response.data;
      final chats = data.map((json) => ChatResponse.fromJson(json)).toList();

      emit(ChatState.loaded(chats));
    } catch (e) {
      emit(ChatState.error('Error fetching chats: $e'));
    }
  }
}