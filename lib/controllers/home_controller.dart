import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/main.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var user = new User();
  Future<User> currentUser() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url = Uri.parse(
        ApiEndponits().baseUrl + ApiEndponits().endpoints.currentUser);

    http.Response res = await http.get(url, headers: headers);
    final json = jsonDecode(res.body);
    user = await User.fromJson(json['data']['user']);
    return user;
  }
}
