import 'dart:convert';

import 'package:myskul/main.dart';
import 'package:myskul/models/payment.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PaymentController {
  static Future<List<PaymentMethod>> getPaymentMethods() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url = Uri.parse(
        ApiEndponits().baseUrl + ApiEndponits().endpoints.payment + "/methods");

    http.Response res = await http.get(url, headers: headers);
    final json = jsonDecode(res.body);
    if (json != null) {
      return (json['data']['res'] as List)
          .map((e) => PaymentMethod.fromJson(e))
          .toList();
    }
    return [];
  }
}
