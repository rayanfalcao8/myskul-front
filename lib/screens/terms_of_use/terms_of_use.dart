import 'package:flutter/material.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  bool? isChecked = false;

  void _onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("ACCEPT_TERMS", true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: "Conditions d'utilisation",
          showBackBtn: false,
          context: context),
      body: Container(
        decoration: getBckDecoration(),
        child: ListView(
          children: [
            Text("Lorem ipsum"),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                SizedBox(width: 10),
                Text("Accepter les termes et conditions d'utilisation"),
              ],
            ),
            if (isChecked == true)
              NewButtonG(
                text: "Continuer",
                function: () async {
                  _onDone(context);
                },
              ),
          ],
        ),
      ),
    );
  }
}
