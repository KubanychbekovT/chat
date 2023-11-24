part of 'message_cubit.dart';
@freezed
class MessageState with _$MessageState {
  const factory MessageState.initial() = _Initial;
  const factory MessageState.loading() = _Loading;
  const factory MessageState.loaded(List<MessageRequest> messages) = _Loaded;
  const factory MessageState.error(String errorMessage) = _Error;
}


