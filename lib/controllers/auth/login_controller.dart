import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/controllers/home_controller.dart';
import 'package:myskul/main.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void login(emailController, passwordController) async {
    try {
      var headers = {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json"
      };
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().authEndpoints.loginEmail);
      Map body = {
        "email": emailController,
        "password": passwordController
      };

      EasyLoading.show();

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);

      EasyLoading.dismiss();

      if (res.statusCode == 200) {

        EasyLoading.showSuccess('Success!');

        final json = jsonDecode(res.body);
        if (json['message'].contains('uccess')) {
          var tmp = json['data'];
          var token = tmp['token'];
          print("token $token");
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);
         var user = await HomeController().currentUser();
          await prefs.setString('user', user.toJson().toString());
          Get.off(Home(
            user: user,
          )); 
        } else {
          throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
        }
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  void logout() async {
    EasyLoading.show();
    await Future.delayed(Duration(seconds: 5));
    EasyLoading.dismiss();
    final SharedPreferences? prefs = await _prefs;
    prefs?.clear();
    Get.offAll(Login());
  }
}
