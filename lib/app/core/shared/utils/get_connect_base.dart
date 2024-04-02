import 'package:get/get.dart';

import 'enviroment.dart';

class GetConnectBase extends GetConnect {
  GetConnectBase() {
    httpClient.baseUrl = Environment.apiUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(minutes: 1);
  }

  Future<Map<String, String>> authHeader() async {
    var token = Environment.accessToken;
    return {
      "Authorization": token ?? '',
    };
  }
}
