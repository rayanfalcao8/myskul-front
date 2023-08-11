import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/components/genderBox.dart';
import 'package:myskul/components/newButtonD.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/auth/lv.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/newButtonG.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SP1 extends StatefulWidget {
  @override
  State<SP1> createState() => _SP1State();
}

class _SP1State extends State<SP1> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var selectedSP = 2;

  bool? checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1.4,
                decoration: BoxDecoration(
                    color: couleurs.white.withOpacity(0.5),
                    image: DecorationImage(
                        image: AssetImage("assets/images/math.png"),
                        opacity: 0.04,
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Positioned(
                      top: 0.0,
                      child: Image.asset(
                        "assets/images/wave-t.png",
                      ),
                    ),
                    Container(),
                    Positioned(
                      bottom: 0.0,
                      child: Image.asset(
                        "assets/images/wave-b.png",
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  child: AnimationLimiter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 500),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Image.asset(
                            "assets/images/logo2.png",
                            width: 100,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "CHOISIS TA SPECIALITE !",
                                style: GoogleFonts.getFont('Lato',
                                    textStyle: textes.h1l),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Bounceable(
                                    onTap: () {
                                      setState(() {
                                        selectedSP = 0;
                                      });
                                    },
                                    child: GenderBox(
                                      couleurs: couleurs,
                                      selectedGender: selectedSP,
                                      gradients: gradients,
                                      icones: icones.medical,
                                      textes: textes,
                                      condition: 0,
                                      gender: "MEDECINE \n DENTAIRE",
                                      width: 140,
                                      height: 140,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Bounceable(
                                    onTap: () {
                                      setState(() {
                                        selectedSP = 1;
                                      });
                                    },
                                    child: GenderBox(
                                      couleurs: couleurs,
                                      selectedGender: selectedSP,
                                      gradients: gradients,
                                      icones: icones.medical,
                                      textes: textes,
                                      condition: 1,
                                      gender: "PHARMACIE",
                                      width: 140,
                                      height: 140,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Bounceable(
                                onTap: () {
                                  setState(() {
                                    selectedSP = 2;
                                  });
                                },
                                child: GenderBox(
                                  couleurs: couleurs,
                                  selectedGender: selectedSP,
                                  gradients: gradients,
                                  icones: icones.medical,
                                  textes: textes,
                                  condition: 2,
                                  gender: "MEDECINE \n GENERALE",
                                  width: 140,
                                  height: 300,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          NewButtonD(
                              textes: textes,
                              couleurs: couleurs,
                              icones: icones,
                              text: "PRECEDENT",
                              function: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          NewButtonG(
                              textes: textes,
                              couleurs: couleurs,
                              icones: icones,
                              text: "SUIVANT",
                              function: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LV();
                                }));
                              }),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
