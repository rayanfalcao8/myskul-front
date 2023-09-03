import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/components/messages_tiles.dart';
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/screens/chat/chat.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/components/input.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myskul/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupChat extends StatefulWidget {
  GroupChat({required this.user});
  User user;
  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  static final db = FirebaseFirestore.instance;

  late CollectionReference groups;

  List<Widget> displayGroups(List<QueryDocumentSnapshot<Object?>> snap) {
    List<Widget> w = [];
    var tmp;
    for (var i = 0; i < snap.length; i++) {
      tmp = snap[i].data() as Map;
      w.add(GroupWidget(
        couleurs: couleurs,
        textes: textes,
        group: tmp,
        user: widget.user,
      ));
    }

    return w;
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getUserGroup() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    final fmToken = await prefs.getString('fmToken');

    Map userTmp = {
      'userId': widget.user.id,
      'userName': widget.user.username,
      'userPic': widget.user.profile_image,
      'userEmail': widget.user.email,
      'userPushToken': fmToken,
    };

    groups = db.collection("groupes");

    return
        groups.where("members", arrayContains: userTmp).get().then((value) {
      if (value.docs.isNotEmpty) {
        print('Not Empty');
        return value.docs;
      } else {
        print("Empty");
        return value.docs;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    fit: BoxFit.cover),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height / 11),
                  ),
                  FutureBuilder(
                      future: getUserGroup(),
                      builder: (ctx,
                          AsyncSnapshot<List<QueryDocumentSnapshot<Object?>>>
                              snapshot) {
                        // Checking if future is resolved or not
                        if (snapshot.connectionState == ConnectionState.done) {
                          // If we got an error
                          if (snapshot.hasError) {
                            return NotFoundWidget(
                                texte: snapshot.error.toString());
                            // if we got our data
                          } else if (snapshot.hasData) {
                            // Extracting data from snapshot object
                            if (snapshot.data!.isEmpty) {
                              return NotFoundWidget(
                                  texte: 'not-found-group'.tr);
                            } else {
                              return AnimationLimiter(
                                  child: Column(
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 375),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                    horizontalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: widget,
                                    ),
                                  ),
                                  children: displayGroups(snapshot.data!),
                                ),
                              ));
                            }
                          }
                        }

                        // Displaying LoadingSpinner to indicate waiting state
                        return Column(
                          children: [
                            SizedBox(
                                height:
                                    (MediaQuery.of(context).size.height / 2.5)),
                            Center(
                              child: CircularProgressIndicator(
                                color: couleurs.green,
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 11,
                decoration: BoxDecoration(
                    gradient: gradients.greenGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            Text(
                              "discuss-group".tr,
                              style: textes.h2l.copyWith(color: couleurs.white),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupWidget extends StatelessWidget {
  const GroupWidget({
    super.key,
    required this.couleurs,
    required this.textes,
    required this.group,
    required this.user,
  });

  final ColorHelper couleurs;
  final TextHelper textes;
  final Map group;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        Get.to(() => Chat(
              user: user,
              group: group,
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        margin: EdgeInsets.all(05),
        decoration: BoxDecoration(
            color: couleurs.white,
            border: Border(
                bottom: BorderSide(color: couleurs.green.withOpacity(0.2)),
                top: BorderSide(color: couleurs.green.withOpacity(0.2)),
                left: BorderSide(color: couleurs.green.withOpacity(0.2)),
                right: BorderSide(color: couleurs.green.withOpacity(0.2)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(group['groupPic'] ??
                          'https://placehold.co/600x400/png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      group['groupName'],
                      style: textes.h2l
                          .copyWith(color: couleurs.black.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 150),
                      child: Text(
                        group['recentMessage'] != ''
                            ? '~ ${group['recentMessageSender']} : ${group['recentMessage']}'
                            : ' Pas de message ',
                        style: textes.h4l
                            .copyWith(color: couleurs.black.withOpacity(0.8)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: couleurs.green.withOpacity(0),
              radius: 12,
              // child: Text('10+',style: textes.bodyTextb.copyWith(color: couleurs.white,fontSize: 9),),
            )
          ],
        ),
      ),
    );
  }
}
