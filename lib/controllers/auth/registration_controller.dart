import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterationController extends GetxController {
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var numController = TextEditingController();
  var bdController = TextEditingController();
  var cityController = TextEditingController();
  var genderController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void register() async {
    try {
      var header = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().authEndpoints.registerEmail);
      Map body = {
        "first_name": userController.text.trim(),
        "last_name": "",
        "email": emailController.text.trim(),
        "password": passwordConfController.text.trim(),
        "gender": genderController.text.trim(),
        "birthdate": bdController.text.trim(),
        "phone_number": numController.text.trim()
      };

      var res = await post(url, body: jsonEncode(body), headers: header);

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        if (json['code'] == 0) {
          var token = json['data']['token'];
          print(token);
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);
          userController.clear();
          emailController.clear();
          passwordConfController.clear();
          genderController.clear();
          bdController.clear();
          numController.clear();
        } else {
          throw jsonDecode(res.body)['message'] ?? "Erreur inconnue";
        }
      } else {
        throw jsonDecode(res.body)['message'] ?? "Erreur inconnue";
      }
    } catch (e) {
      Get.back();
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
