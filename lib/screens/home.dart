import 'package:flutter/material.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  var couleurs = ColorHelper();
  var textes = TextHelper();
  var icones = IconHelper();
  var gradients = GradientHelper();
  List<String> images = [
    "phone.jpg",
    "image1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icones.menu,
                      color: couleurs.green,
                      size: 30,
                    ),
                    Image.asset(
                      "assets/images/logo2.png",
                      width: 35,
                    ),
                    Icon(
                      icones.notif,
                      color: couleurs.green,
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
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      viewportFraction: 1.2,
                    ),
                  ),
                ]),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(gradient: gradients.greenGradient),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nEtiam semper lacinia nunc . ",
                      style: textes.h4l.copyWith(color: couleurs.white),
                    ),
                  ],
                ),
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
                          "TABLEAU DE BORD",
                          style: textes.h2l.copyWith(color: couleurs.grey),
                        ),
                        SizedBox(
                          height: 05,
                        ),
                        Container(
                          height: 1,
                          width: 100,
                          margin: EdgeInsets.only(left: 4),
                          color: couleurs.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashBox(
                          couleurs: couleurs,
                          icone: icones.quiz,
                          textes: textes,
                          texte: "Quiz",
                          couleur: Colors.blue,
                        ),
                        DashBox(
                          couleurs: couleurs,
                          icone: icones.shop,
                          textes: textes,
                          texte: "Shop",
                          couleur: Colors.black26,
                        ),
                        DashBox(
                          couleurs: couleurs,
                          icone: icones.chat,
                          textes: textes,
                          texte: "Chat",
                          couleur: Colors.pink,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashBox(
                          couleurs: couleurs,
                          icone: icones.leader,
                          textes: textes,
                          texte: "Leaderboard",
                          couleur: couleurs.lemon,
                        ),
                        DashBox(
                          couleurs: couleurs,
                          icone: icones.shop,
                          textes: textes,
                          texte: "ChatGPT",
                          couleur: couleurs.lightGreen,
                        ),
                        DashBox(
                          couleurs: couleurs,
                          icone: icones.fitness,
                          textes: textes,
                          texte: "Fitness",
                          couleur: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ABONNEMENT ACTUEL",
                          style: textes.h2l.copyWith(color: couleurs.grey),
                        ),
                        SizedBox(
                          height: 05,
                        ),
                        Container(
                          height: 1,
                          width: 100,
                          margin: EdgeInsets.only(left: 4),
                          color: couleurs.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.05,
                          height: 200,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: couleurs.green),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashBox extends StatelessWidget {
  const DashBox({
    super.key,
    required this.couleurs,
    required this.icone,
    required this.texte,
    required this.couleur,
    required this.textes,
  });

  final ColorHelper couleurs;
  final IconData icone;
  final TextHelper textes;
  final String texte;
  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {},
      child: SizedBox(
        width: 120,
        height: 100,
        child: Material(
          elevation: 10,
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
                    color: couleurs.white.withOpacity(0.5),
                  ),
                  child: Icon(
                    icone,
                    color: couleurs.white,
                    size: 20,
                  ),
                ),
                Text(
                  texte,
                  style: textes.h4b
                      .copyWith(color: couleurs.white.withOpacity(0.8)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
