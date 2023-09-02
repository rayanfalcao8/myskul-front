import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/controllers/auth/password_controller.dart';
import 'package:myskul/screens/auth/register.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/components/input.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Reset extends StatelessWidget {
  Reset({required this.email, required this.token});
  var couleurs = ColorHelper();
  var textes = TextHelper();
  var icones = IconHelper();
  var controller = TextEditingController();
  var onSubmit = (String a) {};
  var keyboardType = TextInputType.visiblePassword;
  var hintText = "new-password";
  var prefixIcon = Icon(Icons.lock);

  var controller2 = TextEditingController();
  var onSubmit2 = (String a) {};
  var keyboardType2 = TextInputType.visiblePassword;
  var hintText2 = "password-conf";
  var prefixIcon2 = Icon(Icons.lock);

  var email;
  var token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1.1,
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
                  height: MediaQuery.of(context).size.height,
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
                                "password-reset-title".tr,
                                style: GoogleFonts.getFont('Lato',
                                    textStyle: textes.h1l),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "password-reset-title2".tr,
                                style: GoogleFonts.getFont('Lato',
                                    textStyle: textes.h1l),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                              width: 300,
                              child: Text(
                                "password-reset-text".tr,
                                style: textes.h4l,
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          NewInput(
                              obscureText: true,
                              controller: controller,
                              onSubmit: onSubmit,
                              keyboardType: keyboardType,
                              hintText: hintText,
                              prefixIcon: prefixIcon),
                          NewInput(
                              obscureText: true,
                              controller: controller2,
                              onSubmit: onSubmit2,
                              keyboardType: keyboardType2,
                              hintText: hintText2,
                              prefixIcon: prefixIcon2),
                          SizedBox(
                            height: 30,
                          ),
                          NewButtonG(
                            text: "reset",
                            function: () {
                              if (controller.text.isEmpty) {
                                EasyLoading.showError("Mot de passe Requis");
                              } else if (controller2.text.isEmpty ||
                                  controller2.text.isEmpty !=
                                      controller.text.isEmpty) {
                                EasyLoading.showError(
                                    "Les deux Mots de passe ne correspondent pas");
                              } else {
                                PasswordController().reset(
                                    email, controller.text, controller2.text, token);
                              }
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
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
