import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/components/gender_box.dart';
import 'package:myskul/components/input_number.dart';
import 'package:myskul/controllers/auth/registration_controller.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/auth/terms.dart';
import 'package:myskul/screens/auth/domain.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/components/input.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var noms = TextEditingController();

  var email = TextEditingController();

  var num = TextEditingController();

  var ville = TextEditingController();

  var datenaiss = TextEditingController();

  var password = TextEditingController();

  var passwordConfirm = TextEditingController();

  var selectedGender = 0;

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
                height: MediaQuery.of(context).size.height * 1.5,
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
                    WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromTop(
                              duration: Duration(milliseconds: 500)),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          "assets/images/wave-t.png",
                        ),
                      ),
                    ),
                    Container(),
                    WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(
                              duration: Duration(milliseconds: 500)),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/images/wave-b.png",
                        ),
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
                                "new-account".tr,
                                style: GoogleFonts.getFont('Lato',
                                    textStyle: textes.h1l),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          NewInput(
                              controller: noms,
                              onSubmit: (g) {},
                              keyboardType: TextInputType.text,
                              hintText: "firstname-lastname",
                              prefixIcon: Icon(icones.user)),
                          NewInput(
                              controller: email,
                              onSubmit: (g) {},
                              keyboardType: TextInputType.emailAddress,
                              hintText: "email",
                              prefixIcon: Icon(icones.user)),
                          NewInputInter(
                              controller: num,
                              onSubmit: (g) {},
                              keyboardType: TextInputType.phone,
                              hintText: "phone",
                              prefixIcon: Icon(icones.user)),
                          NewInput(
                              controller: ville,
                              onSubmit: (g) {},
                              keyboardType: TextInputType.text,
                              hintText: "city",
                              prefixIcon: Icon(icones.city)),
                          NewInput(
                              controller: datenaiss,
                              readOnly: true,
                              onSubmit: (g) {},
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: couleurs
                                                .green, // header background color
                                            onPrimary: couleurs
                                                .white, // header text color
                                            onSurface: couleurs
                                                .black, // body text color
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: couleurs
                                                  .black, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                    context: context,
                                    initialDate:
                                        DateTime.now(), //get today's date
                                    firstDate: DateTime(
                                        1900), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd').format(
                                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2022-07-04
                                  //You can format date as per your need

                                  setState(() {
                                    datenaiss.text =
                                        formattedDate; //set foratted date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              keyboardType: TextInputType.datetime,
                              hintText: "bd",
                              prefixIcon: Icon(icones.calendar)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Bounceable(
                                onTap: () {
                                  setState(() {
                                    selectedGender = 0;
                                  });
                                },
                                child: GenderBox(
                                  selectedGender: selectedGender,
                                  icones: icones.boy,
                                  condition: 0,
                                  gender: "male",
                                  width: 145,
                                  height: 80,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Bounceable(
                                onTap: () {
                                  setState(() {
                                    selectedGender = 1;
                                  });
                                },
                                child: GenderBox(
                                  selectedGender: selectedGender,
                                  icones: icones.girl,
                                  condition: 1,
                                  gender: "female",
                                  width: 145,
                                  height: 80,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          NewInput(
                              obscureText: true,
                              controller: password,
                              onSubmit: (g) {},
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "password",
                              prefixIcon: Icon(icones.lock)),
                          NewInput(
                              obscureText: true,
                              controller: passwordConfirm,
                              onSubmit: (g) {},
                              keyboardType: TextInputType.visiblePassword,
                              hintText: "password-conf",
                              prefixIcon: Icon(icones.lock)),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                  value: checkbox,
                                  onChanged: (v) {
                                    setState(() {
                                      checkbox = v;
                                    });
                                  }),
                              Row(
                                children: [
                                  Text(
                                    "tos1".tr,
                                    style: textes.h4l,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Term();
                                      }));
                                    },
                                    child: Text("tos2".tr,
                                        style: textes.h4l
                                            .copyWith(color: couleurs.green)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          NewButtonG(
                            text: "signup",
                            function: () {
                              if (noms.text.isEmpty) {
                                EasyLoading.showError("Nom Requis");
                              } else if (email.text.isEmpty) {
                                EasyLoading.showError("Mot de passe Requis");
                              } else if (num.text.isEmpty) {
                                EasyLoading.showError("Numéro Requis");
                              } else if (ville.text.isEmpty) {
                                EasyLoading.showError("Ville Requis");
                              } else if (datenaiss.text.isEmpty) {
                                EasyLoading.showError(
                                    "Date de naissance Requis");
                              } else if (password.text.isEmpty) {
                                EasyLoading.showError("Mot de passe Requis");
                              } else if (passwordConfirm.text.isEmpty ||
                                  passwordConfirm.text != password.text) {
                                EasyLoading.showError(
                                    "Mot de passe ne correspond pas");
                              } else if (checkbox == false) {
                                EasyLoading.showError(
                                    "Veuillez accepter les conditions d'utlisation");
                              } else {
                                RegisterationController().register(
                                    userController: noms.text,
                                    numController: num.text,
                                    emailController: email.text,
                                    cityController: ville.text,
                                    bdController: datenaiss.text,
                                    passwordController: password.text,
                                    genderController: selectedGender);
                              }
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "already-reg".tr,
                                style: textes.h4l,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Login();
                                  }));
                                },
                                child: Text(
                                  "connect-min".tr,
                                  style: textes.h4l
                                      .copyWith(color: couleurs.green),
                                ),
                              )
                            ],
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
