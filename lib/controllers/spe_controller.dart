import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/main.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpeController extends GetxController {
  
  Future<List<String>> getDomains() async {
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

    print(json);

    List<String> list = [];

    for (var element in json['data']['domains']) {
      var tmp = element as Map;

      list.add(tmp['name']);
    }

    return list;
  }

  Future<List<String>> getSchool() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url =
        Uri.parse(ApiEndponits().baseUrl + ApiEndponits().endpoints.school);

    http.Response res = await http.get(url, headers: headers);

    final json = jsonDecode(res.body);

    List<String> list = [];

    for (var element in json['data']['schools']) {
      var tmp = element as Map;

      list.add(tmp['display_name']);
    }

    return list;
  }

  Future<List<String>> getLevel() async {
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

    List<String> list = [];

    for (var element in json['data']['levels']) {
      var tmp = element as Map;

      list.add(tmp['level']);
    }

    return list;
  }

  Future<List<String>> getSpec() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url = Uri.parse(
        ApiEndponits().baseUrl + ApiEndponits().endpoints.specialities);

    http.Response res = await http.get(url, headers: headers);

    final json = jsonDecode(res.body);

    List<String> list = [];

    for (var element in json['data']['specialities']) {
      var tmp = element as Map;

      list.add(tmp['speciality']);
    }

    return list;
  }
}
