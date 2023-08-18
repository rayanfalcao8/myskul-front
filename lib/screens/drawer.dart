import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/controllers/auth/login_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({required this.user});
  User user;
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  final String _url = ('https://wa.link/7ipjc4');

  final Future<SharedPreferences> _prefs2 = SharedPreferences.getInstance();

  Future<void> _launchUrl() async {
    if (!await launch(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor:
                                    couleurs.white.withOpacity(0.1),
                                radius: 08,
                              )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor:
                                    couleurs.white.withOpacity(0.1),
                                radius: 15,
                              )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor:
                                    couleurs.white.withOpacity(0.1),
                                radius: 15,
                              )),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(user.profile_image),
                              radius: 30,
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
                            SizedBox(
                              width: 170,
                              child: Text(
                                user.first_name + " " + user.last_name,
                                style:
                                    textes.h3b.copyWith(color: couleurs.white),
                                overflow: TextOverflow.ellipsis,
                              ),
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
                title: Row(
                  children: [
                    Icon(
                      icones.account,
                      color: couleurs.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("my-account".tr),
                  ],
                ),
                tileColor:
                    Get.currentRoute == '/home' ? Colors.grey[300] : null,
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      icones.library,
                      color: couleurs.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('my-lib'.tr),
                  ],
                ),
                tileColor:
                    Get.currentRoute == '/home' ? Colors.grey[300] : null,
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      icones.subscription,
                      color: couleurs.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('my-sub'.tr),
                  ],
                ),
                tileColor:
                    Get.currentRoute == '/home' ? Colors.grey[300] : null,
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      icones.history,
                      color: couleurs.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('history'.tr),
                  ],
                ),
                tileColor:
                    Get.currentRoute == '/home' ? Colors.grey[300] : null,
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      icones.partner,
                      color: couleurs.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('our-part'.tr),
                  ],
                ),
                tileColor:
                    Get.currentRoute == '/home' ? Colors.grey[300] : null,
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      icones.help,
                      color: couleurs.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('sav'.tr),
                  ],
                ),
                onTap: _launchUrl,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Bounceable(
                    onTap: () async {
                      Get.updateLocale(Locale("fr"));
                      final SharedPreferences prefs = await _prefs2;
                      await prefs.setString('locale', "fr");
                      print(Get.locale);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/fr.png",
                          width: 20,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                                width: 20,
                                height: 5,
                                color:  Get.locale.toString() == "fr"
                            ?couleurs.green : couleurs.white ,
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
                    onTap: () async {
                      
                      Get.updateLocale(Locale("en"));
                      final SharedPreferences prefs = await _prefs2;
                      await prefs.setString('locale', "en");
                      print(Get.locale);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/en.png",
                          width: 25,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                         Container(
                                width: 20,
                                height: 5,
                                color:  Get.locale.toString() == "en"
                            ?couleurs.green : couleurs.white ,
                              ),
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
