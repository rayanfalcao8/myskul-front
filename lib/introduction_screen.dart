import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/utilities/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> _pages = [
    PageViewModel(
      title: "Bienvenue sur MySkull",
      body:
          "Votre plateforme de e-learning vous permettant d'étudier avec plusieurs options possibles",
      image: Container(
        child: Image.asset(
          "assets/images/learning.png",
          fit: BoxFit.fitHeight,
        ),
      ),
      decoration: getPageDec(),
    ),
    PageViewModel(
      title: "Souscription",
      body:
          "Pour profiter des différents cours offerts par l'application il vous faut souscrire à un abonnement",
      image: Container(
        child: Image.asset(
          "assets/images/learning.png",
          fit: BoxFit.fitHeight,
        ),
      ),
      decoration: getPageDec(),
    ),
    PageViewModel(
      title: "Quiz",
      body:
          "Révisez de manière interractive et divertissant avec une panoplie de questions organisées sous forme de Quiz !",
      image: Center(
        child: Image.asset("assets/images/learning.png"),
      ),
      decoration: getPageDec(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: "Introduction", context: context, showBackBtn: false),
      body: IntroductionScreen(
        pages: _pages,
        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Color(0xff22987f),
          activeSize: Size.square(15),
          activeColor: Colors.red,
        ),
        showDoneButton: true,
        done: const Text("Terminé", style: TextStyle(fontSize: 15)),
        showSkipButton: true,
        skip: const Text("Passer", style: TextStyle(fontSize: 15)),
        next: const Icon(Icons.arrow_forward, size: 20),
        onDone: () => _onDone(context),
      ),
    );
  }

  void _onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("ON_BOARDING", false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }
}
