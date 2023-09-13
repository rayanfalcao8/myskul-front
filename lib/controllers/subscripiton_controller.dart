import 'dart:convert';

import 'package:myskul/models/subscription.dart';
import 'package:myskul/main.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SubscriptionController {
  Future<List<Subscription>> getSubscriptions() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url = Uri.parse(
        ApiEndponits().baseUrl + ApiEndponits().endpoints.subscription);

    http.Response res = await http.get(url, headers: headers);
    final json = jsonDecode(res.body);
    // print(json);
    return (json['data']['subscriptions'] as List)
        .map((e) => Subscription.fromJson(e))
        .toList();
  }
}
