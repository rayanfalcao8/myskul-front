import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myskul/models/category.dart';
import 'package:myskul/models/quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../utilities/api_endpoints.dart';

class QuizController extends GetxController {
  getQuizzesByCategory(int categoryId) async {
    var token;
    List<QuizModel> quizList = [];
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    token = await prefs.getString('token');
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };
      var url = Uri.parse(ApiEndponits().baseUrl +
          ApiEndponits().endpoints.quizList +
          categoryId.toString());

      EasyLoading.show();

      http.Response res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);

        json['data']['quizzes'].forEach((elt) {
         
          quizList.add(QuizModel.fromJson(elt));
        });

        // var tmp1 = json as Map<String, dynamic>;
        // var tmp2 = tmp1['data']['quizzes'];

        // List quizList = List.generate(
        //     tmp2.length, (index) => QuizModel.fromJson(tmp2[index]));

        EasyLoading.dismiss();

        return quizList;
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

  getCategories() async {
    var token;
    var categories;

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    token = await prefs.getString('token');
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };
      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().endpoints.categories);

      EasyLoading.show();

      http.Response res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<Category> categories = [];
        json['data']['categories'].forEach((elt) {
          categories.add(Category.fromJson(elt));
        });

        EasyLoading.dismiss();
        EasyLoading.showSuccess(json['message']);
        return categories;
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
