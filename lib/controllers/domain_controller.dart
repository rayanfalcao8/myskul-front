import 'dart:convert';

import 'package:myskul/models/domain.dart';
import 'package:myskul/main.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DomainController {
  static Future<List<Domain>> getAll() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url =
        Uri.parse(ApiEndponits().baseUrl + ApiEndponits().endpoints.domain);

    http.Response res = await http.get(url, headers: headers);
    final json = jsonDecode(res.body);
    return (json['data']['domains'] as List)
        .map((e) => Domain.fromJson(e))
        .toList();
  }

  // static Future<Domain> getById(String id) async {
  //   token = await (await SharedPreferences.getInstance()).getString('token');
  //   var headers = {
  //     "Authorization": "Bearer" + " " + token.toString(),
  //     "Content-Type": "application/json; charset=UTF-8",
  //     "Accept": "application/json",
  //   };

  //   var url = Uri.parse(
  //       ApiEndponits().baseUrl + ApiEndponits().endpoints.domain + id);

  //   http.Response res = await http.get(url, headers: headers);
  //   final json = jsonDecode(res.body);
  //   return Domain.fromJson(json['data']['domain']);
  // }

  // static Future<Domain> create(Domain domain) async {
  //   token = await (await SharedPreferences.getInstance()).getString('token');
  //   var headers = {
  //     "Authorization": "Bearer" + " " + token.toString(),
  //     "Content-Type": "application/json; charset=UTF-8",
  //     "Accept": "application/json",
  //   };

  //   var url =
  //       Uri.parse(ApiEndponits().baseUrl + ApiEndponits().endpoints.domain);

  //   http.Response res = await http.post(url, headers: headers, body: domain);
  //   final json = jsonDecode(res.body);
  //   return Domain.fromJson(json['data']['domain']);
  // }
}
