import 'package:dio/dio.dart';
import 'package:flutter_app/api/config_dio.dart';

class GetExperiencias {
  static Future<List>? fetch() async {
    Dio dio = InitDio.dio();
    Response response = await dio.get(
      "wallet/",
      options: Options(headers: {}),
    );
    print(response.data);
    return response.data.first;
  }
}
