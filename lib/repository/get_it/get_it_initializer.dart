import 'package:chat/repository/get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt();

Future<void> getItSetUp() async {
  getIt.registerSingleton(await SharedPreferences.getInstance());
}