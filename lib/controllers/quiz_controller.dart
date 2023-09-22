import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myskul/models/category.dart';
import 'package:myskul/models/question.dart';
import 'package:myskul/models/quiz.dart';
import 'package:myskul/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
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

      http.Response res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);

        json['data']['quizzes'].forEach((elt) {
          quizList.add(QuizModel.fromJson(elt));
        });

        return quizList;
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
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

      http.Response res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<Category> categories = [];
        json['data']['categories'].forEach((elt) {
          categories.add(Category.fromJson(elt));
        });

        return categories;
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  getQuestionsByTheme(int id) async {
    var token;
    List<QuestionModel> questionList = [];
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
          ApiEndponits().endpoints.questions +
          id.toString());

      EasyLoading.show();

      http.Response res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);

        json['data']['questions'].forEach((elt) {
          questionList.add(QuestionModel.fromJson(elt));
        });

        EasyLoading.dismiss();

        return questionList;
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  getLeaderBoard() async {
    var token;

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
          ApiEndponits().baseUrl + ApiEndponits().endpoints.leaderboard);

      http.Response res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<User> leaders = [];
        json['data']['leaderboard'].forEach((elt) {
          leaders.add(User.fromJson(elt));
        });

        return [
          leaders,
          User.fromJson(json['data']['user']),
          json['data']['position']
        ];
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  answerQuiz({required score, required QuizModel quiz}) async {
    var token;
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    token = await prefs.getString('token');
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };

      if (quiz.done == false) {
        var body = {
          "score": score,
          "theme_id": quiz.id,
        };

        var url =
            Uri.parse(ApiEndponits().baseUrl + ApiEndponits().endpoints.quiz);

        http.Response res =
            await http.post(url, headers: headers, body: jsonEncode(body));

        if (res.statusCode == 200) {
          print("Nouveau score $score");
        } else {
          throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
        }
      } else {
        var body = {
          "score": score,
        };

        var url = Uri.parse(ApiEndponits().baseUrl +
            ApiEndponits().endpoints.quiz +
            '/' +
            quiz.id.toString());

        http.Response res =
            await http.put(url, headers: headers, body: jsonEncode(body));

        if (res.statusCode == 200) {
          print("Score mis à jour : nouveau score $score");
        } else {
          throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
        }
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
