import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/components/gender_box.dart';
import 'package:myskul/components/button_d.dart';
import 'package:myskul/controllers/auth/registration_controller.dart';
import 'package:myskul/controllers/home_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/button_g.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LV extends StatefulWidget {
  LV({this.domain, this.school, this.speciality});

  var domain;
  var school;
  var speciality;

  late User user;

  @override
  State<LV> createState() => _LVState();
}

class _LVState extends State<LV> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var selectedSP = 1;

  bool? checkbox = false;

  var token;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getToken() async {
    final SharedPreferences prefs = await _prefs;
    token = await prefs.getString('token');
  }

  Future<void> init() async {
    widget.user = await HomeController().currentUser();
  }

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
                                "LV".tr,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Bounceable(
                                    onTap: () {
                                      setState(() {
                                        selectedSP = 1;
                                      });
                                    },
                                    child: GenderBox(
                                      selectedGender: selectedSP,
                                      condition: 1,
                                      gender: "1",
                                      width: 90,
                                      height: 80,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Bounceable(
                                    onTap: () {
                                      setState(() {
                                        selectedSP = 2;
                                      });
                                    },
                                    child: GenderBox(
                                      selectedGender: selectedSP,
                                      condition: 2,
                                      gender: "2",
                                      width: 90,
                                      height: 80,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Bounceable(
                                    onTap: () {
                                      setState(() {
                                        selectedSP = 3;
                                      });
                                    },
                                    child: GenderBox(
                                      selectedGender: selectedSP,
                                      condition: 3,
                                      gender: "3",
                                      width: 90,
                                      height: 80,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Bounceable(
                                    onTap: () {
                                      setState(() {
                                        selectedSP = 4;
                                      });
                                    },
                                    child: GenderBox(
                                      selectedGender: selectedSP,
                                      condition: 4,
                                      gender: "4",
                                      width: 90,
                                      height: 80,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Bounceable(
                                    onTap: () {
                                      setState(() {
                                        selectedSP = 5;
                                      });
                                    },
                                    child: GenderBox(
                                      selectedGender: selectedSP,
                                      condition: 5,
                                      gender: "5",
                                      width: 90,
                                      height: 80,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Bounceable(
                                    onTap: () {
                                      setState(() {
                                        selectedSP = 6;
                                      });
                                    },
                                    child: GenderBox(
                                      selectedGender: selectedSP,
                                      condition: 6,
                                      gender: "6",
                                      width: 90,
                                      height: 80,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Bounceable(
                              //   onTap: () {
                              //     setState(() {
                              //       selectedSP = 6;
                              //     });
                              //   },
                              //   child: GenderBox(
                              //     selectedGender: selectedSP,
                              //     condition: 6,
                              //     gender: "7",
                              //     width: 290,
                              //     height: 80,
                              //   ),
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          NewButtonD(
                              text: "previous".tr,
                              function: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          NewButtonG(
                              text: "validate".tr,
                              function: () async {
                                await getToken();
                                await init();
                                RegisterationController().updatePlan(
                                    idController: widget.user.id.toString(),
                                    domainController: widget.domain.toString(),
                                    schoolController: widget.school.toString(),
                                    speController: widget.speciality.toString(),
                                    lvController: selectedSP.toString(),
                                    token: token.toString());
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
