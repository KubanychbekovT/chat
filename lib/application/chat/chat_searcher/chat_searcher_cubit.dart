import 'package:bloc/bloc.dart';
import 'package:chat/domain/chat/all_chats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_searcher_state.dart';
part 'chat_searcher_cubit.freezed.dart';

class ChatSearcherCubit extends Cubit<ChatSearcherState> {
  ChatSearcherCubit() : super(ChatSearcherState.initial());

  void searchChats(String query) {
    final List<ChatResponse> searchedChats = _fetchChatsFromAPI()
        .where((chat) =>
        chat.partnerNickName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(ChatSearcherState(searchedChats));
  }

  List<ChatResponse> _fetchChatsFromAPI() {
    return [
      ChatResponse(chatId: 1,
          fileDataResponse: null!,
          messageResponse: null!,
          partnerNickName: 'partnerNickName')
    ];
  }
}
