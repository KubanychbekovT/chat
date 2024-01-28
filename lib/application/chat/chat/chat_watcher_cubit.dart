import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/managers/chat_manager.dart';
import 'package:chat/repository/chat/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_watcher_cubit.freezed.dart';

part 'chat_watcher_state.dart';

class ChatWatcherCubit extends Cubit<ChatWatcherState> {
  final _chatRepository = ChatRepository();
  StreamSubscription? _messagesSubscription;

  ChatWatcherCubit() : super(const ChatWatcherState.initial());

  Future<void> init() async {
    emit(const ChatWatcherState.loading());
    try {
      final chats = await _chatRepository.getAllChats();
      chatsManager.chats = chats;
      emit(ChatWatcherState.loaded(
        chats: chats,
        key: UniqueKey(),
      ));
    } catch (e) {
      emit(ChatWatcherState.error('Error fetching chats: $e'));
    }
    _messagesSubscription?.cancel();
    _messagesSubscription = chatsManager.newMessageNotifierStream.listen(
      (_) => emit(
        ChatWatcherState.loaded(
          chats: chatsManager.chats.toList(),
          key: UniqueKey(),
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
