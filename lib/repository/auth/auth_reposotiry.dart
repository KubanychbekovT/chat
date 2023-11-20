import 'package:chat/repository/core/constants.dart';
import 'package:chat/repository/core/dio_client.dart';
import 'package:chat/repository/core/token_storage.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<void> signIn(String email, String password) async {
    final response = await dio.post("${Constants.serverBaseUrl}/loginClient",

        data: FormData.fromMap({"email": email, "password": password}));
    print("signIn ${response.statusCode} and ${response.data}");
    await TokenStorage().setAccessToken(response.data["access_token"]);
    await TokenStorage().setRefreshToken(response.data["refresh_token"]);
    await TokenStorage().setId(response.data["object"]["_id"]);
    return;
  }

  Future<void> signUp(
      {required String name,
        required String phone,
        required String email,
        required String password}) async {
    final response = await dio.post("${Constants.serverBaseUrl}/loginClient",
        data: FormData.fromMap({"name":name,"email": email, "password": password}));
    await TokenStorage().setAccessToken(response.data["token"]);
    await TokenStorage().setRefreshToken(response.data["refresh_token"]);
    await TokenStorage().setId(response.data["object"]["_id"]);
    return;
  }
}
