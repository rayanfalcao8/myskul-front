import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/chat/chat_group_list.dart';
import 'package:myskul/screens/drawer.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late User user;

  Future<User> getUser() async {
    final prefs = await _prefs;
    var userString = await prefs.getString('user');
    var userJson = jsonDecode(userString!);
    user = User.fromJson(userJson);
    return user;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> images = [
    "phone.jpg",
    "image1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: ColorHelper().green,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return HomepageScaffold(
                scaffoldKey: scaffoldKey, user: snapshot.data!);
          }
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: ColorHelper().green,
            ),
          ),
        );
      },
      future: getUser(),
    );
  }
}

class HomepageScaffold extends StatelessWidget {
  HomepageScaffold({
    required this.scaffoldKey,
    required this.user,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MainDrawer(user: user),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Bounceable(
                          onTap: () {
                            if (scaffoldKey.currentState!.isDrawerOpen) {
                              scaffoldKey.currentState!.closeDrawer();
                              //close drawer, if drawer is open
                            } else {
                              scaffoldKey.currentState!.openDrawer();
                              //open drawer, if drawer is closed
                            }
                          },
                          child: Icon(
                            IconHelper().menu,
                            color: ColorHelper().green,
                            size: 30,
                          ),
                        ),
                        Image.asset(
                          "assets/images/logo2.png",
                          width: 35,
                        ),
                        Icon(
                          IconHelper().notif,
                          color: ColorHelper().green,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView(children: [
                      CarouselSlider(
                        items: [
                          Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/image1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/phone.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/image1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 300.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 10,
                          enableInfiniteScroll: true,
                          viewportFraction: 1.2,
                        ),
                      ),
                    ]),
                  ),
                  // Container(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration:
                  //       BoxDecoration(gradient: GradientHelper().greenGradient),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nEtiam semper lacinia nunc . ",
                  //         style: TextHelper().h4l.copyWith(color: ColorHelper().white),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration:
                        BoxDecoration(gradient: GradientHelper().greenGradient),
                    child: ListView(children: [
                      CarouselSlider(
                        items: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: GradientHelper().greenGradient),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nEtiam semper lacinia nunc . ",
                                  style: TextHelper()
                                      .h4l
                                      .copyWith(color: ColorHelper().white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: GradientHelper().greenGradient),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nEtiam semper lacinia nunc . ",
                                  style: TextHelper()
                                      .h4l
                                      .copyWith(color: ColorHelper().white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: GradientHelper().greenGradient),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nEtiam semper lacinia nunc . ",
                                  style: TextHelper()
                                      .h4l
                                      .copyWith(color: ColorHelper().white),
                                ),
                              ],
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 50.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 10,
                          enableInfiniteScroll: true,
                          viewportFraction: 1.2,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "dash".tr,
                              style: TextHelper()
                                  .h3l
                                  .copyWith(color: ColorHelper().grey),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            Container(
                              height: 1,
                              width: 100,
                              margin: EdgeInsets.only(left: 4),
                              color: ColorHelper().grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DashBox(
                              icone: IconHelper().quiz,
                              texte: "Quiz",
                              couleur: Colors.blue,
                            ),
                            DashBox(
                              icone: IconHelper().shop,
                              texte: "Shop",
                              couleur: Colors.black26,
                            ),
                            DashBox(
                              icone: IconHelper().chat,
                              texte: "Chat",
                              couleur: Colors.pink,
                              function: () {
                                Get.to(() => GroupChat(user: user));
                              },
                            ),
                            SizedBox()
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DashBox(
                              icone: IconHelper().leader,
                              texte: "Leaderboard",
                              couleur: ColorHelper().lemon,
                            ),
                            DashBox(
                              icone: IconHelper().shop,
                              texte: "ChatGPT",
                              couleur: ColorHelper().lightGreen,
                            ),
                            DashBox(
                              icone: IconHelper().fitness,
                              texte: "Fitness",
                              couleur: Colors.red,
                            ),
                            SizedBox()
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "current-plan".tr,
                              style: TextHelper()
                                  .h3l
                                  .copyWith(color: ColorHelper().grey),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            Container(
                              height: 1,
                              width: 100,
                              margin: EdgeInsets.only(left: 4),
                              color: ColorHelper().grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Bounceable(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.05,
                                height: 200,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: ColorHelper().green),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                          "assets/images/arc-01.png",
                                          width: 250,
                                        )),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        user.domain.length > 0 ?  user.domain[0]['display_name'] : ' ',
                                          style: TextHelper().h2l.copyWith(
                                              color: ColorHelper().green),
                                        ),
                                      
                                        SizedBox(
                                          height: 10,
                                        ),

                                        Text(
                                          user.speciality!=null ? user.speciality['sigle']:' ',
                                          style: TextHelper().h4b.copyWith(
                                              color: ColorHelper().green),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                         user.school!=null ? user.school['display_name'] : ' ',
                                          style: TextHelper().h4b.copyWith(
                                              color: ColorHelper().green),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                         user.level!=null ? user.level['level'] : ' ',
                                          style: TextHelper().h4l.copyWith(
                                              color: ColorHelper().green),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                        "assets/images/learning.png",
                                        width: 250,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "user-info".tr,
                              style: TextHelper()
                                  .h3l
                                  .copyWith(color: ColorHelper().grey),
                            ),
                            SizedBox(
                              height: 05,
                            ),
                            Container(
                              height: 1,
                              width: 110,
                              margin: EdgeInsets.only(left: 4),
                              color: ColorHelper().grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("15", style: TextHelper().h3b),
                                      Text("t-quiz".tr,
                                          style: TextHelper().h4l),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("15", style: TextHelper().h3b),
                                      Text("r".tr, style: TextHelper().h4l),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 110,
                                width: 1,
                                color: ColorHelper().grey.withOpacity(0.1),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "score".tr,
                                    style: TextHelper()
                                        .h3r
                                        .copyWith(color: ColorHelper().green),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("150",
                                      style: TextHelper().xxlb.copyWith(
                                          color: ColorHelper().green)),
                                ],
                              ),
                              Container(
                                height: 110,
                                width: 1,
                                color: ColorHelper().grey.withOpacity(0.1),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("200", style: TextHelper().h3b),
                                      Text("t-question".tr,
                                          style: TextHelper().h4l),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("15", style: TextHelper().h3b),
                                      Text("t".tr, style: TextHelper().h4l),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashBox extends StatelessWidget {
  DashBox({
    required this.icone,
    required this.texte,
    required this.couleur,
    this.function,
  });

  final IconData icone;
  final String texte;
  final Color couleur;
  void Function()? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        width: 110,
        height: 100,
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(10),
          color: couleur.withOpacity(0.5),
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorHelper().white.withOpacity(0.5),
                  ),
                  child: Icon(
                    icone,
                    color: ColorHelper().white,
                    size: 20,
                  ),
                ),
                Text(
                  texte,
                  style: TextHelper()
                      .h4b
                      .copyWith(color: ColorHelper().white.withOpacity(0.8)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
