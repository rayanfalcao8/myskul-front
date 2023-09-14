import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../components/messages_tiles.dart';
import '../../controllers/quiz_controller.dart';
import '../../models/user.dart';

class LeaderBoard extends StatefulWidget {
  LeaderBoard({required this.user});
  User user;
  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

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
                  left: -10,
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
                                  NetworkImage(widget.user.profile_image),
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
                  child: FutureBuilder(
                    future: QuizController().getLeaderBoard(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.done) {
                        var res = snapshot.data as dynamic;
                        var leaders = res[0] as List<User>;
                        var user = res[1] as User;
                        var position = res[2];

                        return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  WidgetAnimator(
                                    incomingEffect:
                                    WidgetTransitionEffects.incomingSlideInFromLeft(
                                        duration: Duration(milliseconds: 500)),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                          AssetImage('assets/images/loading.gif'),
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage:
                                            NetworkImage(leaders[1].profile_image),
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
                                                "${leaders[1].score} pts",
                                                style: textes.h3b
                                                    .copyWith(color: couleurs.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                  WidgetAnimator(
                                    incomingEffect:
                                    WidgetTransitionEffects.incomingSlideInFromTop(
                                        duration: Duration(milliseconds: 500)),
                                    child: Column(
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
                                            NetworkImage(leaders[0].profile_image),
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
                                                "${leaders[0].score} pts",
                                                style: textes.h3b
                                                    .copyWith(color: couleurs.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  WidgetAnimator(
                                    incomingEffect:
                                    WidgetTransitionEffects.incomingSlideInFromRight(
                                        duration: Duration(milliseconds: 500)),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                          AssetImage('assets/images/loading.gif'),
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage:
                                            NetworkImage(leaders[2].profile_image),
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
                                                "${leaders[2].score} pts",
                                                style: textes.h3b
                                                    .copyWith(color: couleurs.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                                  itemCount: leaders.length,
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
                                          NetworkImage(leaders[index].profile_image),
                                        ),
                                      ),
                                      title: Text(leaders[index].name),
                                      subtitle: Text((index+1).toString()),
                                      trailing: Container(
                                        child: Text("${leaders[index].score.toString()} pts"),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Material(
                              elevation: 0.1,
                              child: Container(
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
                                      NetworkImage(user.profile_image),
                                    ),
                                  ),
                                  title: Text(user.name),
                                  subtitle: Text(position.toString()),
                                  trailing: Container(
                                    child: Text("${user.score.toString()} pts"),
                                  ),
                                ),
                              ),
                              )
                            ],
                          );
                      } else if (snapshot.hasError) {
                        print(snapshot.error);
                        return NotFoundWidget(texte: 'not-found'.tr);
                      } else {
                        return Positioned(
                          bottom: 400,
                          left: 180,
                          child: CircularProgressIndicator(color: couleurs.white,),
                        ); // Display the fetched data
                      }
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
