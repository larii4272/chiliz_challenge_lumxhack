import 'package:dio/dio.dart';
import 'package:flutter_app/api/config_dio.dart';

class PostTransaction {
  // 0c55a54c-bbf7-463d-83ed-d433cfbb82fd/c584720d-da8e-414a-aea3-c90c93fcf6b9
  static Future? post(int tokenId) async {
    Dio dio = InitDio.dio();
    Response response = await dio.post(
      "purchase_solidity_token/",
      queryParameters: {},
      data: {
        "myToken": tokenId,
        "wallet": "0x1aD23C224296B7033bCB88c58e085315a32d013E",
        "user": "admin"
      },
    );
    print(response.data);
  }
}
