import 'package:chat/domain/user/user.dart';
import 'package:chat/presentation/core/utils/firebase_helper.dart';
import 'package:chat/repository/get_it/get_it_initializer.dart';
import 'package:chat/repository/user/user_repository.dart';

final profileManager = getIt<ProfileManager>();

class ProfileManager {
  User? user;
  final _userRepository = UserRepository();

  Future<void> init() async {
    user = null;
    user = await _userRepository.getUser(FirebaseHelper.currentUser.uid);
  }
}
