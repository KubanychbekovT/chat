part of 'all_chats_cubit.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.loaded(List<ChatResponse> chats) = _Loaded;
  const factory ChatState.error(String error) = _Error;
}