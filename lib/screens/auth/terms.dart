import 'package:flutter/material.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class Term extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  var couleurs = ColorHelper();
  var gradients = GradientHelper();
  var icones = IconHelper();
  var textes = TextHelper();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: gradients.greenGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      icones.back2,
                      color: couleurs.white,
                    ),
                  ),
                ],
              ),
              Text(
                "TERMES ET CONDITIONS GENERALES D'UTILISATION",
                style: textes.h4l.copyWith(color: couleurs.white),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.8,
                decoration: BoxDecoration(
                    color: couleurs.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
