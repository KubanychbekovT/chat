import 'package:bloc/bloc.dart';
import 'package:chat/domain/user/user.dart';
import 'package:chat/presentation/core/utils/firebase_helper.dart';
import 'package:chat/repository/user/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_cubit.freezed.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final _userRepository = UserRepository();

  ProfileCubit() : super(const ProfileState.initial());

  Future<void> loadProfile() async {
    emit(const ProfileState.loading());
    try {
      final user = await _userRepository.getUser(FirebaseHelper.currentUser.uid);
      emit(ProfileState.loaded(user: user));
    } catch (e) {
      emit(const ProfileState.failed());
    }
  }

  Future<void> logout() async {
    await _userRepository.logout();
    emit(const ProfileState.logout());
  }
}
