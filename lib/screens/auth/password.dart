import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/controllers/auth/password_controller.dart';
import 'package:myskul/screens/auth/register.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/newButtonG.dart';
import 'package:myskul/components/newInput.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Password extends StatelessWidget {
  var couleurs = ColorHelper();
  var textes = TextHelper();
  var icones = IconHelper();
  var controller = TextEditingController();
  var onSubmit = (String a) {};
  var keyboardType = TextInputType.emailAddress;
  var hintText = "Adresse Email";
  var prefixIcon = Icon(Icons.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                      child: Positioned(
                        top: 0.0,
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
                      child: Positioned(
                        bottom: 0.0,
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
                                "RECUPERATION DE",
                                style: GoogleFonts.getFont('Lato',
                                    textStyle: textes.h1l),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "MOT DE PASSE",
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
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis varius urna arcu, sodales cursus magna porttitor et.",
                                style: textes.h4l,
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          NewInput(
                              controller: controller,
                              onSubmit: onSubmit,
                              keyboardType: keyboardType,
                              hintText: hintText,
                              textes: textes,
                              couleurs: couleurs,
                              prefixIcon: prefixIcon),
                          SizedBox(
                            height: 30,
                          ),
                          NewButtonG(
                            textes: textes,
                            couleurs: couleurs,
                            icones: icones,
                            text: "ENVOYER",
                            function: (){
                              PasswordController().password(controller);
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Nouveau ?",
                                style: textes.h4l,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Register();
                                  }));
                                },
                                child: Text(
                                  " Créer un compte",
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
