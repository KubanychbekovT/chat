part of 'chat_searcher_cubit.dart';

@freezed
class ChatSearcherState with _$ChatSearcherState {
  factory ChatSearcherState({
    required List<Chat> searchedChats,
    required List<User> searchedUsers,
    required bool isLoading,
  }) = _ChatSearcherState;

  factory ChatSearcherState.initial() => ChatSearcherState(
    searchedChats: [],
    searchedUsers: [],
    isLoading: false,
  );
}


