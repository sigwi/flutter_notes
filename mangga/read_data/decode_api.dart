import 'dart:convert';

import 'package:http/http.dart' as http;

class DecodeApi {
  // late final String api;

  static Future getData(String api) async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
