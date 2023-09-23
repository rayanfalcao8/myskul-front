import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myskul/models/quiz.dart';
import 'package:myskul/screens/quiz/quiz_5.dart';
import 'package:myskul/utilities/colors.dart';

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var couleurs = ColorHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelper().green,
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 20,
                )),
            Positioned(
                top: 50,
                right: 40,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 08,
                )),
            Positioned(
                top: MediaQuery.of(context).size.height / 5,
                right: 40,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 15,
                )),
            Positioned(
                top: MediaQuery.of(context).size.height / 5,
                left: 40,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 25,
                )),
            Positioned(
                top: 0,
                left: MediaQuery.of(context).size.width / 1.5,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 28,
                )),
            Positioned(
                top: 40,
                left: 40,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 08,
                )),
            Positioned(
                bottom: 80,
                left: 40,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 08,
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 20,
                )),
            Positioned(
                bottom: 50,
                right: 40,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 08,
                )),
            Positioned(
                bottom: MediaQuery.of(context).size.height / 5,
                right: 40,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 15,
                )),
            Positioned(
                bottom: MediaQuery.of(context).size.height / 5,
                left: 40,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 25,
                )),
            Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width / 1.5,
                child: CircleAvatar(
                  backgroundColor: couleurs.white.withOpacity(0.05),
                  radius: 28,
                )),
            Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: ColorHelper().white, size: 70),
            ),
          ],
        ));
  }
}
