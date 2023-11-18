import 'package:chat/repository/core/token_storage.dart';
import 'package:dio/dio.dart';

final dio=getDioInstance();
Dio getDioInstance(){
  final dio=Dio();
  dio.options.headers["access-place"] = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpbmciLCJhdXRoIjp7ImF1dGhvcml0eSI6IlVTRVIifSwiaWF0IjoxNzAwMjg0NDEyLCJleHAiOjE3MDA1ODQ0MTJ9.sRa6Wg47tZDIMNonDJPcVPVpQ8IrPSqyLfNBtsDL-iI";
  if(TokenStorage.isAuthorized){
    dio.options.headers["x-access-token"] = TokenStorage.accessToken;
  }
  return dio;
}