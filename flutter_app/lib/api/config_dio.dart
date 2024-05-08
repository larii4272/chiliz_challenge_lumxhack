import 'package:dio/dio.dart';

class InitDio {
  static Dio dio() {
    return Dio(
      BaseOptions(
        baseUrl: "http://localhost:8000/",
        contentType: "application/json",
      ),
    );
  }
}
