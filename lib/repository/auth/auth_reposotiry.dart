import 'package:chat/repository/core/constants.dart';
import 'package:chat/repository/core/dio_client.dart';
import 'package:chat/repository/core/token_storage.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<void> signIn(String email, String password) async {
    try {
      final url = "${Constants.serverBaseUrl}";
      final data = {
        "email": "email",
        "password": "password",
      };

      print('Request Url; $url');
      print('Request Data: $data');

      final options = Options(
        contentType: Headers.jsonContentType,
        // You can add additional headers if needed
        // headers: {
        //   "Authorization": "Bearer $accessToken",
        // },
      );

      final response = await Dio().post(
        url,
        data: FormData.fromMap(data),
        options: options,
      );

      // Handle response based on status code and data
    } catch (e) {
      print('Sign In Error: $e');
      throw Exception('Failed to sign in: $e');
    }
  }
}
//   Future<void> signUp({
//     required String nickname,
//     required String phone,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await dio.post(
//         "${Constants.serverBaseUrl}/loginClient",
//         data: FormData.fromMap({
//           "nickname": nickname,
//           "email": email,
//           "password": password,
//         }),
//       );
//
//       final accessToken = response.data["token"];
//       final refreshToken = response.data["refresh_token"];
//       final userId = response.data["object"]["_id"];
//
//       await TokenStorage().setAccessToken(accessToken);
//       await TokenStorage().setRefreshToken(refreshToken);
//       await TokenStorage().setId(userId);
//     } catch (e) {
//       throw Exception('Failed to sign up: $e');
//     }
//   }
// }
