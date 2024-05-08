import 'package:dio/dio.dart';
import 'package:flutter_app/api/config_dio.dart';

class GetAtletas {
  static Future<List>? fetch() async {
    Dio dio = InitDio.dio();
    Response response = await dio.get(
      "athletes/",
      options: Options(headers: {}),
    );
    return response.data;
  }
}
