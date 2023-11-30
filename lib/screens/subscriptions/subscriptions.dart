import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:myskul/controllers/auth/registration_controller.dart';
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/controllers/subscripiton_controller.dart';
import 'package:myskul/models/subscription.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/subscriptions/subscription_form.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/constants.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Subscriptions extends StatefulWidget {
  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var colors = ColorHelper();

  var spec;
  var user;

  getUser() async {
    final prefs = await _prefs;
    var userString = await prefs.getString('user');
    var userJson = jsonDecode(userString!);
    user = User.fromJson(userJson);
    spec = user.speciality['speciality'];
  }

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: "Abonnements", context: context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SubscriptionForm()));
          },
          backgroundColor: Color(0xff22987f),
          child: Icon(Icons.add),
        ),
        body: Container(
          decoration: getBckDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colors.grey.withOpacity(0.1),
                    prefixIcon: Icon(Icons.search, color: colors.black),
                    hintText: "search".tr,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Liste des abonnements",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: SubscriptionController.getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        List<Subscription>? subs = snapshot.data;
                        if (subs != null && subs.isNotEmpty) {
                          print("Length: ${subs.length}");
                          return ListView(
                            children: List.generate(subs.length,
                                (index) => _buildSubscription(subs[index])),
                          );
                        }
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.warning,
                            size: 64.0,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 15.0),
                          Text("Vous n'avez souscrit à aucun abonnement"),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildSubscription(Subscription subscription) {
    var token;

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    Future<void> getToken() async {
      final SharedPreferences prefs = await _prefs;
      token = await prefs.getString('token');
    }

    return InkWell(
      onTap: () {
        RegisterationController().updatePlan(
            idController: user.id!.toString(),
            domainController: subscription.domainId!.toString(),
            speController: subscription.specialityId!.toString(),
            lvController: subscription.levelId!.toString(),
            token: token);
            setState(() {
              
            });
      },
      child: Card(
          elevation: 1,
          color: subscription.speciality!.speciality!
                  .toLowerCase()
                  .contains(spec.toString().toLowerCase())
              ? ColorHelper().green
              : ColorHelper().white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (subscription.domain != null)
                      Text("${subscription.domain!.displayName}",
                          style: TextStyle(
                              color: subscription.speciality!.speciality!
                                      .toLowerCase()
                                      .contains(spec.toString().toLowerCase())
                                  ? ColorHelper().white
                                  : ColorHelper().grey)),
                    Text(
                      "${subscription.level!.level}",
                      style: TextStyle(
                          color: subscription.speciality!.speciality!
                                  .toLowerCase()
                                  .contains(spec.toString().toLowerCase())
                              ? ColorHelper().white
                              : ColorHelper().grey),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                if (subscription.speciality != null)
                  Text(
                    "${subscription.speciality!.speciality}",
                    style: TextStyle(
                        color: subscription.speciality!.speciality!
                                .toLowerCase()
                                .contains(spec.toString().toLowerCase())
                            ? ColorHelper().white
                            : ColorHelper().grey),
                  ),
              ],
            ),
          )),
    );
  }
}
