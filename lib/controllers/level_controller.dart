import 'dart:convert';

import 'package:myskul/models/level.dart';
import 'package:myskul/main.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LevelController {
  static Future<List<Level>> getAll() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url =
        Uri.parse(ApiEndponits().baseUrl + ApiEndponits().endpoints.level);

    http.Response res = await http.get(url, headers: headers);
    final json = jsonDecode(res.body);
    return (json['data']['levels'] as List)
        .map((e) => Level.fromJson(e))
        .toList();
  }

  // static Future<Level> getById(String id) async {
  //   token = await (await SharedPreferences.getInstance()).getString('token');
  //   var headers = {
  //     "Authorization": "Bearer" + " " + token.toString(),
  //     "Content-Type": "application/json; charset=UTF-8",
  //     "Accept": "application/json",
  //   };

  //   var url = Uri.parse(
  //       ApiEndponits().baseUrl + ApiEndponits().endpoints.level + id);

  //   http.Response res = await http.get(url, headers: headers);
  //   final json = jsonDecode(res.body);
  //   return Level.fromJson(json['data']['level']);
  // }

  // static Future<Level> create(Level level) async {
  //   token = await (await SharedPreferences.getInstance()).getString('token');
  //   var headers = {
  //     "Authorization": "Bearer" + " " + token.toString(),
  //     "Content-Type": "application/json; charset=UTF-8",
  //     "Accept": "application/json",
  //   };

  //   var url =
  //       Uri.parse(ApiEndponits().baseUrl + ApiEndponits().endpoints.level);

  //   http.Response res = await http.post(url, headers: headers, body: level);
  //   final json = jsonDecode(res.body);
  //   return Level.fromJson(json['data']['level']);
  // }
}
