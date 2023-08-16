import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/controllers/auth/login_controller.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/utilities/gradients.dart';

class MainDrawer extends StatelessWidget {
  var couleurs = ColorHelper();
  var textes = TextHelper();
  var icones = IconHelper();
  var gradients = GradientHelper();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Positioned(
                                top: 0,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor:
                                      couleurs.white.withOpacity(0.1),
                                  radius: 05,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Positioned(
                                top: 50,
                                right: 40,
                                child: CircleAvatar(
                                  backgroundColor:
                                      couleurs.white.withOpacity(0.1),
                                  radius: 15,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Positioned(
                                top: 50,
                                right: 40,
                                child: CircleAvatar(
                                  backgroundColor:
                                      couleurs.white.withOpacity(0.1),
                                  radius: 20,
                                )),
                            SizedBox(
                              width: 60,
                            ),
                            Positioned(
                                bottom: 0,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor:
                                      couleurs.white.withOpacity(0.1),
                                  radius: 08,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/boy.png",
                              width: 70,
                            ),
                            SizedBox()
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Bounceable(
                              onTap: () {
                                LoginController().logout();
                              },
                              child: Icon(
                                icones.logout,
                                color: couleurs.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gumball Watterson',
                              style: textes.h4b.copyWith(color: couleurs.white),
                            ),
                            SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: gradients.greenGradient,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20)),
                ),
              ),
              ListTile(
                title: Text('Home'),
                tileColor:
                    Get.currentRoute == '/home' ? Colors.grey[300] : null,
                onTap: () {},
              ),
              ListTile(
                title: Text('Item 1'),
                tileColor:
                    Get.currentRoute == '/page1' ? Colors.grey[300] : null,
                onTap: () {},
              ),
              ListTile(
                title: Text('Item 2'),
                tileColor:
                    Get.currentRoute == '/page2' ? Colors.grey[300] : null,
                onTap: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Bounceable(
                    onTap: () {},
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/fr.png",
                          width: 20,
                        ),
                        SizedBox(height: 2,),
                        Container(
                          width: 20,
                          height: 5,
                          color: couleurs.green,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    color: couleurs.black.withOpacity(0.1),
                  ),

                  Bounceable(
                    onTap: () {},
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/en.png",
                          width: 25,
                        ),
                        // SizedBox(height: 2,),
                        // Container(
                        //   width: 25,
                        //   height: 5,
                        //   color: couleurs.green,
                        // ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
