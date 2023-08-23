import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/screens/auth/login.dart';
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
         "first_name": str[0] ?? " ",
        "last_name": str.length > 2 ? str[1] : " ",
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "gender": genderController.toString(),
        "birthdate": bdController.text.trim(),
        "phone_number": numController.text.trim(),
        "address": cityController.text.trim(),
      };

      EasyLoading.show(status: 'Inscription...');

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);


      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        var json = jsonDecode(res.body);
        EasyLoading.showSuccess(json['message']);
        Get.off(Login());
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



   void updateUser(
      {userController,
      emailController,
      numController,
      bdController,
      cityController,
      genderController, token}) async {
    try {
      var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().endpoints.updateUser);

      List str = userController.text.split(" ");

      Map body = {
        "first_name": str[0] ?? " ",
        "last_name": str.length >= 2 ? str[1] : " ",
        "email": emailController.text.trim(),
        "gender": genderController.toString(),
        "birthdate": bdController.text.trim(),
        "phone_number": numController.text.trim(),
        "address": cityController.text.trim(),
      };

      EasyLoading.show(status: 'Chargement...');

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);


      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        var json = jsonDecode(res.body);
        EasyLoading.showSuccess(json['message']);
        Get.back();
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
