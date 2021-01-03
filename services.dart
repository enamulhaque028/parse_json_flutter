import 'dart:convert';

import 'package:get_api/model.dart';
import 'package:http/http.dart' as http;

class Services {
  //
  static const String url = 'http://203.130.133.166/ATI-ERP2/ticket-lookup';
  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        //print(body);
        final Iterable json = body;
        return json.map((user) => User.fromJson(user)).toList();
      } else {
        return List<User>();
      }
    } catch (e) {
      return List<User>();
    }
  }
}
