import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskul/components/genderBox.dart';
import 'package:myskul/components/newInputInter.dart';
import 'package:myskul/controllers/auth/registration_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/account_password.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/auth/terms.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:myskul/components/newButtonG.dart';
import 'package:myskul/components/newInput.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

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
                  MessagesDate(textes: textes, couleurs: couleurs),
                  ReceivedMessage(
                    couleurs: couleurs,
                    textes: textes,
                    texte:
                        'Adding Firebase to your app involves tasks both in the ',
                  ),
                  SentMessage(
                    couleurs: couleurs,
                    textes: textes,
                    texte: '❤',
                  ),
                  ReceivedMessage(
                    couleurs: couleurs,
                    textes: textes,
                    texte: '😘',
                  ),
                  ReceivedMessage(
                    couleurs: couleurs,
                    textes: textes,
                    texte: '💕',
                  ),
                  SentMessage(
                    couleurs: couleurs,
                    textes: textes,
                    texte:
                        'you download Firebase config files from the console',
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
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
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
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
                          ],
                        ),
                        Text(
                          "NOM DU CHAT",
                          style: textes.h2l.copyWith(color: couleurs.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                width: MediaQuery.of(context).size.width,
                color: couleurs.green,
                child: Row(children: [
                  Expanded(
                      child: TextFormField(
                    // controller: messageController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: couleurs.green,
                    decoration: const InputDecoration(
                      hintText: "Send a message...",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      // sendMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: couleurs.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.send,
                        color: Colors.white,
                      )),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesDate extends StatelessWidget {
  const MessagesDate({
    super.key,
    required this.textes,
    required this.couleurs,
    this.texte = 'Date du jour',
  });

  final TextHelper textes;
  final String texte;
  final ColorHelper couleurs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 10) + 10,
        ),
        Center(
          child: Text(
            texte,
            style: textes.h3l.copyWith(color: couleurs.grey),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class SentMessage extends StatelessWidget {
  SentMessage({
    super.key,
    required this.couleurs,
    required this.textes,
    required this.texte,
  });

  final ColorHelper couleurs;
  final TextHelper textes;
  final String texte;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 150),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: couleurs.green.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Text(
                texte,
                style: textes.h4r,
                overflow: TextOverflow.clip,
              ),
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/boy.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    super.key,
    required this.couleurs,
    required this.textes,
    required this.texte,
  });

  final ColorHelper couleurs;
  final TextHelper textes;
  final String texte;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/girl.png'),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 150),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: couleurs.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                texte,
                style: textes.h4r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
