import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  final Future<SharedPreferences> _prefs2 = SharedPreferences.getInstance();

  void first() async {
    final SharedPreferences prefs = await _prefs2;
    bool? seen = await prefs.getBool('first');
    if (seen == null || seen == false) {
      await prefs.setBool('first', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/splash_1.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/images/wave-t.png",
                    ),
                  ),
                  Container(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/images/wave-b.png",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: couleurs.lightGreen.withOpacity(0.6),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
                  duration: const Duration(seconds: 1),
                  delay: const Duration(milliseconds: 100)),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   "assets/images/logo2.png",
                      //   width: 100,
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "main-title1".tr,
                            style: GoogleFonts.getFont('Lato',
                                textStyle: textes.xxlb
                                    .copyWith(color: couleurs.white)),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "main-title2".tr,
                            style: GoogleFonts.getFont('Lato',
                                textStyle: textes.xxlb
                                    .copyWith(color: couleurs.white)),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "main-subtitle1".tr,
                            style: GoogleFonts.getFont('Lato',
                                textStyle:
                                    textes.h1r.copyWith(color: couleurs.white)),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                             "main-subtitle2".tr,
                            style: GoogleFonts.getFont('Lato',
                                textStyle:
                                    textes.h1r.copyWith(color: couleurs.white)),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 70,
                      ),

                      Bounceable(
                        onTap: () {},
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              first();
                              Get.off(() => Login());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  Text("start".tr,
                                      style: GoogleFonts.getFont('Lato',
                                          textStyle: textes.h3b.copyWith(
                                              color: couleurs.green))),
                                  CircleAvatar(
                                    backgroundColor: couleurs.green,
                                    child: Icon(
                                      icones.forward,
                                      color: couleurs.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(10),
                              backgroundColor:
                                  MaterialStateProperty.all(couleurs.white),
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
