import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:myskul/controllers/subscripiton_controller.dart';
import 'package:myskul/models/subscription.dart';
import 'package:myskul/screens/subscriptions/subscription_form.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/helpers.dart';

class Subscriptions extends StatelessWidget {
  var colors = ColorHelper();

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
    return Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${subscription.domain!.displayName}"),
                  Text("${subscription.level!.level}"),
                ],
              ),
              SizedBox(height: 10),
              Text("${subscription.domain!.name}"),
            ],
          ),
        ));
  }
}
