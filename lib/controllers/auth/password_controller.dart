import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/main.dart';
import 'package:myskul/screens/auth/Password.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PasswordController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void password(emailController) async {
    try {
      var headers = {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json"
      };
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().authEndpoints.password);
      Map body = {
        "email": emailController.text.trim(),
      };

      EasyLoading.show(status: 'Connexion...');

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);

      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        EasyLoading.showSuccess(json(['message']));
        emailController.clear();
        // Get.off(Reset());
      } else {
        throw jsonDecode(res.body)['message'] ?? "Erreur inconnue";
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      // showDialog(
      //     context: Get.context!,
      //     builder: (context) {
      //       return SimpleDialog(
      //         title: Text('Erreur'),
      //         contentPadding: EdgeInsets.all(20),
      //         children: [Text(e.toString())],
      //       );
      //     });
    }
  }

  void reset(emailController, passwordController, passwordConfController,
      token) async {
    try {
      var headers = {
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json"
      };
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().authEndpoints.resetPassword);
      Map body = {
        "password": passwordController.text,
        "password_confirmation": passwordConfController.text,
        "email": emailController.text,
        "token": token,
      };

      EasyLoading.show(status: 'Réinitialisation...');

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);


      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        EasyLoading.showSuccess(json(['message']));
        passwordController.clear();
        passwordConfController.clear();
        emailController.clear();
        Get.off(Login());
      } else {
        throw jsonDecode(res.body)['message'] ?? "Erreur inconnue";
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
      // showDialog(
      //     context: Get.context!,
      //     builder: (context) {
      //       return SimpleDialog(
      //         title: Text('Erreur'),
      //         contentPadding: EdgeInsets.all(20),
      //         children: [Text(e.toString())],
      //       );
      //     });
    }
  }
}
