import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/main.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void login(emailController, passwordController) async {
    try {
      var header = {'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json'};
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().authEndpoints.loginEmail);
      Map body = {
        "email": emailController.text,
        "password": passwordController.text
      };

      http.Response res = await http.post(url, body: jsonEncode(body),);
      
      print(" encode ${jsonEncode(body)} decode ${res.body} ");

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        if (json['message'].contains('Successful')) {
          var token = json['data']['token'];
          print("token $token");
          // final SharedPreferences prefs = await _prefs;
          // await prefs.setString('token', token);
          // Get.to(Home());
          // emailController.clear();
          // passwordController.clear();
        } else {
          throw jsonDecode(res.body)['message'] + ' 1 ' ?? "Erreur inconnue";
        }
      } else {
        throw jsonDecode(res.body)['message'] + ' 2 ' ?? "Erreur inconnue";
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Erreur'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
