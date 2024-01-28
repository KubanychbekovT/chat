import 'package:chat/application/user/profile_manager.dart';
import 'package:chat/managers/chat_manager.dart';
import 'package:chat/managers/storage_manager.dart';
import 'package:chat/repository/get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt();

Future<void> getItSetUp() async {
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton(ChatManager());
  getIt.registerSingleton(StorageManager());
  getIt.registerSingleton(ProfileManager());
}
