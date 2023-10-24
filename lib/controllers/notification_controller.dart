import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myskul/models/notif.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utilities/api_endpoints.dart';

class NotificationController extends GetxController {
  recordNotification(var tmp) async {
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

      var body = {
        'id': tmp['id'],
        'titre': tmp['titre'],
        'type': tmp['type'],
        'content': tmp['contenu'],
        'image': tmp['image'] ?? '',
        'isRead': tmp['isRead'],
        'createdAt': tmp['dateDeCreation'],
      };

      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().endpoints.notifications);

      http.Response res =
          await http.post(url, headers: headers, body: jsonEncode(body));

      print("Notifs ${res.request}");

      if (res.statusCode == 200) {
        print("Notifs mise à jour : ${tmp['id']}");
      } else {
        throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  Future<List<Notification>> getAllNotification() async {
    var token;
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    List<Notification> list = [];
    token = await prefs.getString('token');
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };

      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().endpoints.notifications);

      http.Response res = await http.get(url, headers: headers);

      print("debug ${jsonDecode(res.body)['data']['notifications']}");
      var tmp = jsonDecode(res.body)['data']['notifications'] as List;

      if (res.statusCode == 200 && tmp.isNotEmpty) {
        for (var element in tmp) {
          list.add(Notification.fromJson(element));
        }
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
    return list;
  }


   readAllNotification() async {
    var token;
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    List<Notification> list = [];
    token = await prefs.getString('token');
    try {
      var headers = {
        "Authorization": "Bearer" + " " + token.toString(),
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",
      };

      var url = Uri.parse(
          ApiEndponits().baseUrl + ApiEndponits().endpoints.readNotifications);

      http.Response res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        EasyLoading.showSuccess(jsonDecode(res.body)['message']);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
    return list;
  }
}
