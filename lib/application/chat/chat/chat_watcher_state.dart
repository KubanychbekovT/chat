part of 'chat_watcher_cubit.dart';

@freezed
abstract class ChatWatcherState with _$ChatWatcherState {
  const factory ChatWatcherState.initial() = _Initial;

  const factory ChatWatcherState.loading() = _Loading;

  const factory ChatWatcherState.loaded({
    required List<Chat> chats,
    // Для обновления списка чатов при получении нового сообщения
    // без этого сравнение идет по количеству чатов
    required UniqueKey key,
  }) = _Loaded;

  const factory ChatWatcherState.error(String error) = _Error;
}
