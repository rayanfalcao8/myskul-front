import 'package:flutter/material.dart';
import 'package:myskul/controllers/subscripiton_controller.dart';
import 'package:myskul/models/subscription.dart';

class Subscriptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: BackButton(),
            backgroundColor: Color(0xff22987f),
            expandedHeight: 80,
            title: Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text("Abonnements"),
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
          ),
          // Add a SliverToBoxAdapter to display your warning message
          SliverToBoxAdapter(
            child: FutureBuilder(
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
            ),
          ),
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
