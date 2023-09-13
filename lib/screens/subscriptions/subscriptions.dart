import 'package:flutter/material.dart';
import 'package:myskul/controllers/subscripiton_controller.dart';
import 'package:myskul/models/subscription.dart';
import 'package:myskul/screens/subscriptions/subscription_form.dart';
import 'package:myskul/utilities/helpers.dart';

class Subscriptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Abonnements"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SubscriptionForm()));
        },
        backgroundColor: Color(0xff22987f),
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: SubscriptionController.getAll(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 300.0),
                    CircularProgressIndicator(),
                  ],
                );
              } else if (snapshot.hasData) {
                List<Subscription>? subs = snapshot.data;
                if (subs != null && subs.isNotEmpty) {
                  return ListView.builder(
                      itemCount: subs.length,
                      itemBuilder: (context, index) {
                        _buildSubscription(subs[index]);
                      });
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 300.0),
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
          )
        ],
      ),
    );
  }

  Widget _buildSubscription(Subscription subscription) {
    return Card(
        child: Row(
      children: [],
    ));
  }
}
