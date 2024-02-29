import 'package:bloc/bloc.dart';
import 'package:chat/domain/chat/chat/chat.dart';
import 'package:chat/domain/user/user.dart';
import 'package:chat/repository/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_searcher_state.dart';
part 'chat_searcher_cubit.freezed.dart';

class ChatSearcherCubit extends Cubit<ChatSearcherState> {
  ChatSearcherCubit() : super(ChatSearcherState.initial());

  void search(String query) async {
    try {
      print('Start searching for users with query: $query');
      final List<User> searchedUsers = await UserRepository().searchUsers(query);
      print('Search successful. Found ${searchedUsers.length} users.');
      emit(state.copyWith(searchedUsers: searchedUsers));
    } catch (e) {
      print('Search failed: $e');
    }
  }

}
