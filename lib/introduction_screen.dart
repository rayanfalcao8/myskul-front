import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    _pages = [
      _buildPage(
        "Bienvenue sur MySkull",
        "Votre plateforme de e-learning vous permettant d'étudier avec plusieurs options possibles",
        "assets/images/learning.png",
      ),
      _buildPage(
        "Souscription",
        "Souscrivez à un abonnement pour profiter de multiples avantages tel que des cours et des quiz offerts par l'application !",
        "assets/images/subscription.png",
      ),
      _buildPage(
        "Quiz",
        "Révisez de manière interractive et divertissante avec une panoplie de questions organisées sous forme de Quiz !",
        "assets/images/quiz.png",
      )
    ];

    return Scaffold(
      appBar: getAppBar(
          title: "Introduction", context: context, showBackBtn: false),
      body: Container(
        decoration: getBckDecoration(),
        child: IntroductionScreen(
          rawPages: _pages,
          dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            activeSize: Size.square(15),
            activeColor: Color(0xff22987f),
          ),
          showDoneButton: true,
          globalBackgroundColor: Colors.transparent,
          done: const Text("Terminé", style: TextStyle(fontSize: 15)),
          showSkipButton: true,
          skip: const Text("Passer", style: TextStyle(fontSize: 15)),
          next: const Icon(Icons.arrow_forward, size: 20),
          onDone: () => _onDone(context),
        ),
      ),
    );
  }

  void _onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("ON_BOARDING", false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  Widget _buildPage(String title, String body, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 60),
        Container(
          height: 320,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(height: 30),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff22987f),
            fontSize: 27,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            body,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
