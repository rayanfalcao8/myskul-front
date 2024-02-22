import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myskul/models/product.dart';
import 'package:myskul/main.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductController {
  static Future<List<Product>> getAll() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url =
        Uri.parse(ApiEndponits().baseUrl + ApiEndponits().endpoints.product);

    EasyLoading.show();

    http.Response res = await http.get(url, headers: headers);
    final json = jsonDecode(res.body);

    EasyLoading.dismiss();
//print(json['data']['products']);
    return (json['data']['products'] as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  static Future<Product> getById(String id) async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url = Uri.parse(
        ApiEndponits().baseUrl + ApiEndponits().endpoints.product + id);

    http.Response res = await http.get(url, headers: headers);
    final json = jsonDecode(res.body);
    return Product.fromJson(json['data']['product']);
  }

  static Future<List<Product>> getByUser() async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url = Uri.parse(
        ApiEndponits().baseUrl + ApiEndponits().endpoints.product + "/user");

    EasyLoading.show();

    http.Response res = await http.get(url, headers: headers);
    final json = jsonDecode(res.body);

    EasyLoading.dismiss();

    return (json['data']['products'] as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  static Future<bool> purchase(
      {required String productId,
      required String serviceId,
      required String amount,
      required String phoneNumber}) async {
    token = await (await SharedPreferences.getInstance()).getString('token');
    var headers = {
      "Authorization": "Bearer" + " " + token.toString(),
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    var url =
        Uri.parse(ApiEndponits().baseUrl + ApiEndponits().endpoints.product);

    Map data = {
      "productId": productId,
      "serviceId": serviceId,
      "amount": amount,
      "phoneNumber": phoneNumber
    };
    print(data);

    EasyLoading.show();

    try {
      http.Response res =
          await http.post(url, headers: headers, body: jsonEncode(data));
      final json = jsonDecode(res.body);

      EasyLoading.dismiss();

      if (res.statusCode == 200) {
        print("Success");
        return true;
      } else {
        EasyLoading.showInfo("${json.decode(res.body)}");
        return false;
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showInfo("$e");
      return false;
    }
  }
}
