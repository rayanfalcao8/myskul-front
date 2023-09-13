import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/components/input.dart';
import 'package:myskul/utilities/helpers.dart';

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  final formKey = GlobalKey<FormState>();
  final domainIdController = TextEditingController();
  final typeController = TextEditingController();
  final levelIdController = TextEditingController();
  final specialityIdController = TextEditingController();

  @override
  void dispose() {
    domainIdController.dispose();
    typeController.dispose();
    levelIdController.dispose();
    specialityIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Ajouter Abonnement"),
      body: Form(
        key: formKey,
        child: ListView(children: [
          SizedBox(height: 100),
          NewInput(
            controller: domainIdController,
            onSubmit: (g) {},
            hintText: "Id domaine",
            obscureText: true,
          ),
          SizedBox(height: 10),
          NewInput(
            controller: typeController,
            onSubmit: (g) {},
            hintText: "Type",
            obscureText: true,
          ),
          SizedBox(height: 10),
          NewInput(
            controller: levelIdController,
            onSubmit: (g) {},
            hintText: "Id niveau",
            obscureText: true,
          ),
          SizedBox(height: 10),
          NewInput(
            controller: specialityIdController,
            onSubmit: (g) {},
            hintText: "Id specialite",
            obscureText: true,
          ),
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: NewButtonG(
              text: "Souscrire",
              function: () {
                EasyLoading.showSuccess("Souscription effectuée !");
              },
            ),
          ),
        ]),
      ),
    );
  }
}
