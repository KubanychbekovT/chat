part of 'chat_searcher_cubit.dart';

@freezed
class ChatSearcherState with _$ChatSearcherState {
  factory ChatSearcherState(List<Chat> searchedChats) = _ChatSearcherState;

  factory ChatSearcherState.initial() => ChatSearcherState([]);
}

