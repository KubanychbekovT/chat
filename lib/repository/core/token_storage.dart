import 'dart:convert';
import 'package:chat/domain/user/user.dart';
import 'package:chat/repository/get_it/get_it_initializer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage{
  static final _sharedPreferences = getIt<SharedPreferences>();
  Future<void> clearTokenData()async{
    await _sharedPreferences.clear();
  }
  Future<void> setRefreshToken(String? refreshToken) async {
    if (refreshToken != null) {
      await _sharedPreferences.setString('refresh', refreshToken);
    }
  }
  Future<void> setAccessToken(String? accessToken) async {
    if (accessToken != null) {
      await _sharedPreferences.setString('access', accessToken);
    }
  }
  Future<void> setId(String? id) async {
    if (id != null) {
      await _sharedPreferences.setString('id', id);
    }
  }
  Future<void> setUser(User user) async {
    final userJson = user.toJson();
    final userString = json.encode(userJson);
    await _sharedPreferences.setString('user', userString);
  }

  static bool get isAuthorized => _sharedPreferences.getString("access") != null;
  static String? get accessToken => _sharedPreferences.getString('access');
  static String? get refreshToken => _sharedPreferences.getString('refresh');
  static String? get id => _sharedPreferences.getString('id');
  static User? get user {
    final userString = _sharedPreferences.getString('user');
    if (userString != null) {
      final userJson = json.decode(userString);
      return User.fromJson(userJson);
    }
    return null;
  }
}