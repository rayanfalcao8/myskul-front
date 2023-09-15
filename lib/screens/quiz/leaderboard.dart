//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class LeaderBoard extends StatelessWidget {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: MediaQuery.of(context).padding,
            decoration: BoxDecoration(
              gradient: gradients.greenGradient,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 30,
                  left: 0,
                  child: Container(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(color: couleurs.white,),
                        CircleAvatar(
                            radius: 15,
                            backgroundImage:
                                AssetImage('assets/images/loading.gif'),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/girl.png"),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text('LEADERBOARD',
                        style: textes.h1r.copyWith(color: couleurs.white)),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'AUJOURD’HUI',
                        style: textes.h4r
                            .copyWith(color: couleurs.white.withOpacity(0.5)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'CE MOIS',
                        style: textes.h4r.copyWith(color: couleurs.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'DEPUIS LE DEBUT',
                        style: textes.h4r
                            .copyWith(color: couleurs.white.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
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
                    top: MediaQuery.of(context).size.height / 2,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: couleurs.white.withOpacity(0.05),
                      radius: 25,
                    )),
                Positioned(
                    bottom: MediaQuery.of(context).size.height / 2,
                    left: 40,
                    child: CircleAvatar(
                      backgroundColor: couleurs.white.withOpacity(0.05),
                      radius: 35,
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
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/loading.gif'),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("assets/images/boy.png"),
                                ),
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              Container(
                                width: size.width / 5,
                                height: size.height/6,
                                decoration: BoxDecoration(
                                    color: couleurs.white.withOpacity(0.6),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: couleurs.white
                                                .withOpacity(0.5)),
                                        top: BorderSide(
                                            color: couleurs.white
                                                .withOpacity(0.5)),
                                        left: BorderSide(
                                            color: couleurs.white
                                                .withOpacity(0.5)))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "2",
                                      style: textes.xxlb
                                          .copyWith(color: couleurs.white),
                                    ),
                                    Text(
                                      "300 pts",
                                      style: textes.h3b
                                          .copyWith(color: couleurs.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/crown.png',
                                width: 20,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/loading.gif'),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("assets/images/girl.png"),
                                ),
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              Container(
                                width: size.width / 5,
                                height: size.height/4,
                                decoration: BoxDecoration(
                                  color: couleurs.white.withOpacity(0.6),
                                  border: Border(
                                      bottom: BorderSide(
                                          color:
                                              couleurs.white.withOpacity(0.5)),
                                      top: BorderSide(
                                          color:
                                              couleurs.white.withOpacity(0.5)),
                                      left: BorderSide(
                                          color:
                                              couleurs.white.withOpacity(0.5)),
                                      right: BorderSide(
                                          color:
                                              couleurs.white.withOpacity(0.5))),
                                  boxShadow: [
                                    BoxShadow(
                                      color: couleurs.black.withOpacity(0.2),
                                      offset: const Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "1",
                                      style: textes.xxlb
                                          .copyWith(color: couleurs.white),
                                    ),
                                    Text(
                                      "400 pts",
                                      style: textes.h3b
                                          .copyWith(color: couleurs.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/loading.gif'),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("assets/images/boy.png"),
                                ),
                              ),
                              SizedBox(
                                height: 05,
                              ),
                              Container(
                                width: size.width / 5,
                                height: size.height/8,
                                decoration: BoxDecoration(
                                    color: couleurs.white.withOpacity(0.6),
                                    border: Border(
                                        bottom: BorderSide(
                                            color: couleurs.white
                                                .withOpacity(0.5)),
                                        top: BorderSide(
                                            color: couleurs.white
                                                .withOpacity(0.5)),
                                        right: BorderSide(
                                            color: couleurs.white
                                                .withOpacity(0.5)))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "3",
                                      style: textes.xxlb
                                          .copyWith(color: couleurs.white),
                                    ),
                                    Text(
                                      "200 pts",
                                      style: textes.h3b
                                          .copyWith(color: couleurs.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: size.height / 3.5,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: couleurs.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                        ),
                        child: ListView.builder(
                          itemCount: 20,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/loading.gif'),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("assets/images/boy.png"),
                                ),
                              ),
                              title: Text('Nana'),
                              subtitle: Text('10'),
                              trailing: Container(
                                child: Text('400 pts'),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 60,
                        width: size.width,
                        color: couleurs.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/loading.gif'),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/girl.png"),
                            ),
                          ),
                          title: Text('Nana'),
                          subtitle: Text('10'),
                          trailing: Container(
                            child: Text('400 pts'),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
