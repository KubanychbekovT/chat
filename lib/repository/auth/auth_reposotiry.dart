import 'package:chat/repository/core/constants.dart';
import 'package:chat/repository/core/dio_client.dart';
import 'package:chat/repository/core/token_storage.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<void> signIn(String email, String password) async {
    try {
      final response = await dio.post(
        "${Constants.serverBaseUrl}/loginClient",
        data: FormData.fromMap({"email": email, "password": password}),
      );

      final accessToken = response.data["access_token"];
      final refreshToken = response.data["refresh_token"];
      final userId = response.data["object"]["_id"];

      await TokenStorage().setAccessToken(accessToken);
      await TokenStorage().setRefreshToken(refreshToken);
      await TokenStorage().setId(userId);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<void> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "${Constants.serverBaseUrl}/loginClient",
        data: FormData.fromMap({
          "name": name,
          "email": email,
          "password": password,
        }),
      );

      final accessToken = response.data["token"];
      final refreshToken = response.data["refresh_token"];
      final userId = response.data["object"]["_id"];

      await TokenStorage().setAccessToken(accessToken);
      await TokenStorage().setRefreshToken(refreshToken);
      await TokenStorage().setId(userId);
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }
}
