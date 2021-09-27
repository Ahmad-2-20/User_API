import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:users_api/api_kay/data.dart';

class ApiData {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<Data>> format() async {
    List<Data> a = [];

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      for (dynamic pass in jsonResponse) {
        Data temp = Data.fromJason(pass);
        a.add(temp);
      }
      return a;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
