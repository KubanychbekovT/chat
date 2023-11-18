import 'package:dio/dio.dart';

class AuthAPIService {
  final Dio dio;

  AuthAPIService(this.dio);

  Future<void> registerUser(String email, String password) async {
    try {
      final response = await dio.post(
        'https://chatapp.tw1.ru/api/v1/auth/authenticate',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Registration failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}
