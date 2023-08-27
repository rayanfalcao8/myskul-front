import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/main.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:myskul/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeController extends GetxController {
  User user = new User();
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
    user = User.fromJson(json['data']['user']);

    ChatController().addUser(user, Constant().PTCL);
    return user;
  }
}
