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
  var genderController;
  var passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void register(
      {userController,
      emailController,
      numController,
      bdController,
      cityController,
      genderController,
      passwordController}) async {
    try {
      var headers = {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json"
      };
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().authEndpoints.registerEmail);

      var str = userController.text.split(" ");

      Map body = {
        "first_name": str[0] ?? "/",
        "last_name": str[1] ?? "/",
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "gender": genderController.toString(),
        "birthdate": bdController.text.trim(),
        "phone_number": numController.text.trim()
      };

      EasyLoading.show(status: 'Inscription...');

      var res = await post(url, body: jsonEncode(body), headers: headers);
      print(" encode ${jsonEncode(body)} decode ${res.body} ");
      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        EasyLoading.showSuccess(json['message']);
        var tmp = json['data'];
        String token = tmp['token'];
        print("token $token");
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        userController.clear();
        emailController.clear();
        passwordController.clear();
        bdController.clear();
        numController.clear();
      } else {
        throw jsonDecode(res.body)['message'] ?? "Erreur inconnue";
      }
    } catch (e) {
      // showDialog(
      //     context: Get.context!,
      //     builder: (context) {
      //       return SimpleDialog(
      //         title: Text('Erreur'),
      //         contentPadding: EdgeInsets.all(20),
      //         children: [Text(e.toString())],
      //       );
      //     });
      EasyLoading.showError(e.toString());
    }
  }
}
