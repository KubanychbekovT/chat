import 'package:chat/repository/core/token_storage.dart';
import 'package:dio/dio.dart';

final dio=getDioInstance();
Dio getDioInstance(){
  final dio=Dio();
  dio.options.headers["access-place"] = "";
  if(TokenStorage.isAuthorized){
    dio.options.headers["x-access-token"] = TokenStorage.accessToken;
  }
  return dio;
}