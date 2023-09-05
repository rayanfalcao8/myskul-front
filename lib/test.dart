//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class Test extends StatelessWidget {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: gradients.greenGradient,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: size.height / 2,
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width / 5,
                          height: size.height  ,
                          color: couleurs.red,
                        ),
                        SizedBox(
                          width: 01,
                        ),
                        Container(
                          width: size.width / 5,
                          height: size.height / 2,
                          color: couleurs.red,
                        ),
                        SizedBox(
                          width: 01,
                        ),
                        Container(
                          width: size.width / 5,
                          height: size.height / 2,
                          color: couleurs.red,
                        ),
                        SizedBox(
                          width: 01,
                        ),
                      ],
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(top: size.height / 10),
                      height: size.height / 2.5,
                      decoration: BoxDecoration(
                        color: couleurs.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
