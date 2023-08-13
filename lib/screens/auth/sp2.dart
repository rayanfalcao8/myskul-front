import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/components/genderBox.dart';
import 'package:myskul/components/newButtonD.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/newButtonG.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SP2 extends StatefulWidget {
  @override
  State<SP2> createState() => _SP2State();
}

class _SP2State extends State<SP2> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var selectedSP = 1;

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
                            height: 70,
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  textes: textes,
                                  condition: 0,
                                  gender: "PREPA MEDECINE",
                                  width: 305,
                                  height: 70,
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
                                  textes: textes,
                                  condition: 1,
                                  gender: "PREPA CONCOURS IDE",
                                  width: 305,
                                  height: 70,
                                ),
                              ),
                              SizedBox(
                                height: 20,
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
                                  textes: textes,
                                  condition: 2,
                                  gender: "PREPA TCF",
                                  width: 305,
                                  height: 70,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Bounceable(
                                onTap: () {
                                  setState(() {
                                    selectedSP = 3;
                                  });
                                },
                                child: GenderBox(
                                  couleurs: couleurs,
                                  selectedGender: selectedSP,
                                  gradients: gradients,
                                  textes: textes,
                                  condition: 3,
                                  gender: "PREPA TOEIC/TOEFL",
                                  width: 305,
                                  height: 70,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
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
                              text: "VALIDER",
                              function: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Home();
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
