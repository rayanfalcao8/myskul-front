import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: FutureBuilder(
            future: rootBundle.loadString("assets/terms_of_use.md"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    MarkdownBody(
                      data: snapshot.data!,
                      styleSheet: MarkdownStyleSheet(
                        h1: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                    SizedBox(height: 20),
                    NewButtonG(
                      text: "Continuer",
                      function: () async {
                        if (isChecked == true)
                          _onDone(context);
                        else
                          EasyLoading.showInfo(
                              "Veuillez accepter les termes d'utilisation avant de continuer !");
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
