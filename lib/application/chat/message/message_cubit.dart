import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/managers/chat_manager.dart';
import 'package:chat/repository/chat/chat_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_cubit.freezed.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final _chatRepository = ChatRepository();
  StreamSubscription? _messagesSubscription;

  MessageCubit() : super(MessageState.initial());

  void init(Chat chat) {
    emit(state.copyWith(chat: chat));
    _messagesSubscription?.cancel();
    _messagesSubscription = chatsManager.newMessageNotifierStream.listen((_) {
      final updatedChat =
          chatsManager.chats.firstWhere((element) => element.reference == chat.reference);
      emit(state.copyWith(chat: updatedChat));
    });
  }

  Future<void> sendMessage(String text) async {
    try {
      final chat = state.chat!;
      await _chatRepository.sendMessage(chat, text);
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
