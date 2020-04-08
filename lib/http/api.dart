import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkAPI {
  NetworkAPI(this.url);

  final String url;

  Future getData() async {
    Map<String, String> header = {"Content-Type": "application/json"};

    http.Response response = await http.get(url,headers: header,);

    // return if only request is successful
    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
