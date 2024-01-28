part of 'message_cubit.dart';

@freezed
class MessageState with _$MessageState {
   factory MessageState.initial() =>MessageState(chat: null);

  factory MessageState({ required Chat? chat}) = _MessageState;
}
