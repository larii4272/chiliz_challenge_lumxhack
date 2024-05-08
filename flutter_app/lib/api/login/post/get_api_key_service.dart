import 'package:dio/dio.dart';
import 'package:flutter_app/api/config_dio.dart';

class GetAccountAPIKey {
  // 0c55a54c-bbf7-463d-83ed-d433cfbb82fd/c584720d-da8e-414a-aea3-c90c93fcf6b9
  static Future? post(String corganizationName) async {
    Dio dio = InitDio.dio();
    Response response = await dio.post(
      "auth/",
      queryParameters: {},
      data: {
        "name": corganizationName,
        // The one-time-password provided to you by Lumx (only for production environments).
        // "otp": "<string>",
      },
    );
    print(response.data);
  }
}
