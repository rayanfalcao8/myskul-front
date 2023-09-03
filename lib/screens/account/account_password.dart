import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/controllers/auth/registration_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/components/input.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPassword extends StatefulWidget {
  AccountPassword({required this.user});

  User user = User();
  @override
  State<AccountPassword> createState() => _AccountPasswordState();
}

class _AccountPasswordState extends State<AccountPassword> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var oldPassword = TextEditingController();

  var newPassword = TextEditingController();

  var confPassword = TextEditingController();

  var token;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getToken() async {
    final SharedPreferences prefs = await _prefs;
    token = await prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: couleurs.white.withOpacity(0.5),
                image: DecorationImage(
                    image: AssetImage("assets/images/math.png"),
                    opacity: 0.04,
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 2.4,
                      minHeight: MediaQuery.of(context).size.height / 3),
                  decoration: BoxDecoration(
                      gradient: gradients.greenGradient,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Stack(
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
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      icones.back2,
                                      color: couleurs.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    icones.lock,
                                    color: couleurs.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "password-upper".tr,
                            style: textes.h2l.copyWith(color: couleurs.white),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/loading1.gif'),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  NetworkImage(widget.user.profile_image),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                              width: 170,
                              child: Center(
                                child: Text(
                                  widget.user.name,
                                  style: textes.h2l
                                      .copyWith(color: couleurs.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                        ],
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
                              height: 30,
                            ),
                            SizedBox(
                                width: 300,
                                child: Text(
                                  "password-reset-text".tr,
                                  style: textes.h4l,
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            NewInput(
                                controller: oldPassword,
                                obscureText: true,
                                onSubmit: (g) {},
                                keyboardType: TextInputType.visiblePassword,
                                hintText: "old-password",
                                prefixIcon: Icon(icones.lock)),
                            NewInput(
                                controller: newPassword,
                                obscureText: true,
                                onSubmit: (g) {},
                                keyboardType: TextInputType.visiblePassword,
                                hintText: "new-password",
                                prefixIcon: Icon(icones.lock)),
                            NewInput(
                                controller: confPassword,
                                obscureText: true,
                                onSubmit: (g) {},
                                keyboardType: TextInputType.visiblePassword,
                                hintText: "password-conf",
                                prefixIcon: Icon(icones.lock)),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            NewButtonG(
                              text: "save",
                              function: () async {
                                if (oldPassword.text.isEmpty) {
                                  EasyLoading.showError(
                                      "Ancien mot de passe Requis");
                                } else if (newPassword.text.isEmpty) {
                                  EasyLoading.showError(
                                      "Nouveau mot de passe Requis");
                                } else if (confPassword.text !=
                                    newPassword.text) {
                                  EasyLoading.showError(
                                      "Confirmation du mot de passe différente du mot de passe");
                                } else {
                                  await getToken();
                                  RegisterationController().updatePassword(
                                      oldPassword: oldPassword.text,
                                      newPassword: newPassword.text,
                                      token: token);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
