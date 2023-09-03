import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myskul/controllers/home_controller.dart';

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

      Map body = {
        "name": userController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "gender": genderController.toString(),
        "birthdate": bdController.text.trim(),
        "phoneNumber": numController.text.trim(),
        "town": cityController.text.trim(),
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
      EasyLoading.showError(e.toString());
    }
  }

  void updateUser(
      {required idController,
      userController,
      emailController,
      numController,
      bdController,
      cityController,
      genderController,
      required token}) async {
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };
      var url = Uri.parse(ApiEndponits().baseUrl +
          ApiEndponits().endpoints.updateUser +
          idController);

      Map body = {
        "name": userController,
        "email": emailController,
        "gender": genderController.toString(),
        "birthdate": bdController.text.trim(),
        "phoneNumber": numController.text.trim(),
        "town": cityController.text.trim(),
      };

      EasyLoading.show();

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);

      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        final SharedPreferences prefs = await _prefs;
        var user = await HomeController().currentUser();
        await prefs.setString('user', jsonEncode(user.toJson()).toString());
        var json = jsonDecode(res.body);
        EasyLoading.showSuccess(json['message']);

        Get.back();
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
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
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().endpoints.updatePassword);

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
      EasyLoading.showError(e.toString());
    }
  }

  void updatePlan(
      {required idController,
      domainController,
      speController,
      schoolController,
      lvController,
      required token}) async {
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };
      var url = Uri.parse(ApiEndponits().baseUrl +
          ApiEndponits().endpoints.updateUser +
          idController);

      Map body = {
        "level_id": lvController ?? '1',
        "domain_id": domainController ?? '1',
        "speciality_id": speController ?? '1',
        "school_id": schoolController ?? '1',
      };

      EasyLoading.show();

      http.Response res = await http.post(url,
          body: utf8.encode(jsonEncode(body)), headers: headers);

      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        final SharedPreferences prefs = await _prefs;
        var user = await HomeController().currentUser();
        await prefs.setString('user', jsonEncode(user.toJson()).toString());
        var json = jsonDecode(res.body);
        EasyLoading.showSuccess(json['message']);

        Get.to(()=>Home());
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
