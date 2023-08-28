import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterationController extends GetxController {
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
        "last_name": str.length >= 2 ? str[1] : " ${str[0]}",
        "email": emailController,
        "password": passwordController,
        "gender": genderController.toString(),
        "birthdate": bdController,
        "phone_number": numController,
        "address": cityController,
      };

      EasyLoading.show();

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);

      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        var json = jsonDecode(res.body);
        EasyLoading.showSuccess(json['message']);
        Get.off(Login());
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
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
      {idController,
      userController,
      emailController,
      numController,
      bdController,
      cityController,
      genderController,
      token}) async {
    // TODO : Mettre aussi l'utilisateur à jour sur firestore
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };
      var url = Uri.parse(ApiEndponits().baseUrl +
          ApiEndponits().endpoints.updateUser +
          idController);

      List str = userController.split(" ");

      Map body = {
        "first_name": str[0] ?? " ",
        "last_name": str.length >= 2 ? str[1] : " ${str[0]}",
        "email": emailController,
        "gender": genderController.toString(),
        "birthdate": bdController,
        "phone_number": numController,
        "address": cityController,
      };

      // Map userTmp = {
      //   'userId': idController,
      //   'userName': str.length >= 2
      //       ? str[0] + ' ' + str[1]
      //       : " ${str[0] + ' ' + str[0]}",
      //   'userPic':
      //       'https://ui-avatars.com/api/?name=${str[0]}+${str[1]}&color=226520&background=E3FFE3',
      //   'userEmail': emailController,
      // };

      EasyLoading.show();

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);

      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        // FirebaseFirestore.instance
        //     .collection('groupes')
        //     .where("members", arrayContains: userTmp)
        //     .orderBy("time")
        //     .snapshots();
        var json = jsonDecode(res.body);
        EasyLoading.showSuccess(json['message']);

        Get.back();
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
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

  void updatePassword({oldPassword, newPassword, token}) async {
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };
      var url = Uri.parse(ApiEndponits().baseUrl +
          ApiEndponits().endpoints.updatePassword);

      Map body = {
        "password": oldPassword,
        "new_password": newPassword,
      };

      EasyLoading.show();

      http.Response res = await http.put(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);

      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        var json = jsonDecode(res.body);
        EasyLoading.showSuccess(json['message']);

        Get.back();
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
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
