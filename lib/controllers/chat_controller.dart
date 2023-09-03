import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myskul/components/messages_tiles.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/utilities/api_endpoints.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ChatController {
  static final db = FirebaseFirestore.instance;
  static final fMessaging = FirebaseMessaging.instance;

  final CollectionReference groups = db.collection("groupes");
  final CollectionReference messages = db.collection("messages");

// Une fonction pour recuprer les données des groupes sur firestore
  Future<List<Map<String, dynamic>>> getGroups() async {
    Map tmp;
    List<Map<String, dynamic>> list = [];
    groups.get().then((value) {
      for (var doc in value.docs) {
        list.add(doc.data() as Map<String, dynamic>);
      }
    });

    return list;
  }

// Une fonction pour avoir les infos d'un groupe

  Future<Map<String, dynamic>> getGroup(String document) async {
    Map<String, dynamic> tmp = {};
    groups.doc(document).get().then((value) {
      tmp = value.data() as Map<String, dynamic>;
    }).onError((error, stackTrace) => null);

    return tmp;
  }

// Une fonction pour ajouter un utilisateur dans un groupe

  void addUser(User user, String document) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final fmToken = await prefs.getString('fmToken');

    Map userTmp = {
      'userId': user.id,
      'userName': user.username,
      'userPic': user.profile_image,
      'userEmail': user.email,
      'userPushToken': fmToken,
    };
    groups
        .doc(document)
        .update({
          'members': FieldValue.arrayUnion([userTmp])
        })
        .then((value) => print("DocumentSnapshot successfully updated!"))
        .onError((e, stackTrace) =>
            print("Error updating document ${user.email} $e"));
  }

// Raccourci pour ajouter tous les groups sur firestore

  void addAllGroups() async {
    List tmp = [
      {
        'groupName': 'Médecine dentaire',
        'groupPic':
            'https://ui-avatars.com/api/?name=M+D&color=226520&background=E3FFE3',
        'members': '',
        'recentMessage': '',
        'recentMessageSender': '',
        'recentMessageTime': '',
      },
      {
        'groupName': 'Médecine générale',
        'groupPic':
            'https://ui-avatars.com/api/?name=M+G&color=226520&background=E3FFE3',
        'members': '',
        'recentMessage': '',
        'recentMessageSender': '',
        'recentMessageTime': '',
      },
      {
        'groupName': 'Pharmacie',
        'groupPic':
            'https://ui-avatars.com/api/?name=P+H&color=226520&background=E3FFE3',
        'members': '',
        'recentMessage': '',
        'recentMessageSender': '',
        'recentMessageTime': '',
      },
      {
        'groupName': 'Prepa Médecine',
        'groupPic':
            'https://ui-avatars.com/api/?name=P+M&color=226520&background=E3FFE3',
        'members': '',
        'recentMessage': '',
        'recentMessageSender': '',
        'recentMessageTime': '',
      },
      {
        'groupName': 'Prepa IDE',
        'groupPic':
            'https://ui-avatars.com/api/?name=P+I&color=226520&background=E3FFE3',
        'members': '',
        'recentMessage': '',
        'recentMessageSender': '',
        'recentMessageTime': '',
      },
      {
        'groupName': 'Prepa TCL',
        'groupPic':
            'https://ui-avatars.com/api/?name=T+C&color=226520&background=E3FFE3',
        'members': '',
        'recentMessage': '',
        'recentMessageSender': '',
        'recentMessageTime': '',
      },
      {
        'groupName': 'Prepa TOEI/TOEFL',
        'groupPic':
            'https://ui-avatars.com/api/?name=P+T&color=226520&background=E3FFE3',
        'members': '',
        'recentMessage': '',
        'recentMessageSender': '',
        'recentMessageTime': '',
      },
    ];
    for (var element in tmp) {
      groups.add(element);
    }
  }

// Une fonction pour enlever un utilisateur d'un groupe

  void removeUser(User user, String document) async {
    Map userTmp = {
      'userId': user.id,
      'userName': user.username,
      'userPic': user.profile_image,
      'userEmail': user.email,
    };
    groups
        .doc(document)
        .update({
          'members': FieldValue.arrayRemove([userTmp])
        })
        .then((value) => print("DocumentSnapshot successfully updated!"))
        .onError((e, stackTrace) => print("Error updating document $e"));
  }

// Scroll automatique

  void scrollDown(ScrollController ctrl) {
    if (ctrl.positions.isNotEmpty) {
      ctrl.animateTo(ctrl.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  chatMessages({chats, user, couleurs, textes, controller}) {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print("error found");
          return NotFoundWidget(texte: "Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              SizedBox(height: (MediaQuery.of(context).size.height / 2.5)),
              Center(
                child: CircularProgressIndicator(
                  color: couleurs.green,
                ),
              ),
            ],
          );
        }

        return snapshot.data.docs.length > 0
            ? ListView.builder(
                controller: controller,
                itemCount: snapshot.data.docs.length + 1,
                itemBuilder: (context, index) {
                  if (index == snapshot.data.docs.length) {
                    scrollDown(controller);
                    return Container(
                      height: 60,
                    );
                  }
                  if (index == 0) {
                    print('first');
                    SizedBox(
                      height: (MediaQuery.of(context).size.height / 10) + 10,
                    );
                  }
                  var tmp = snapshot.data.docs[index].data() as Map;
                  if (tmp['type'] == 'texte') {
                    if (tmp['sender'] == user.username) {
                      return SentMessage(
                        texte: tmp['message'],
                        image: tmp['senderImage'],
                        nom: tmp['sender'],
                      );
                    }
                    return ReceivedMessage(
                      texte: tmp['message'],
                      image: tmp['senderImage'],
                      nom: tmp['sender'],
                    );
                  } else {
                    if (tmp['sender'] == (user.username)) {
                      return SentImage(
                        tmp: tmp,
                        user: user,
                      );
                    }
                    return ReceivedImage(
                      tmp: tmp,
                      user: user,
                    );
                  }
                },
              )
            : SingleChildScrollView(
                child: NotFoundWidget(texte: 'Pas de message pour le moment'),
              );
      },
    );
  }

// envoyer un message

  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    var users;
    messages.add(chatMessageData);
    groups.doc(groupId).update({
      "recentMessage": chatMessageData['type'] == 'texte'
          ? chatMessageData['message']
          : '📷',
      "recentMessageSender": chatMessageData['sender'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });

    await FirebaseFirestore.instance
        .collection('groupes')
        .where("groupId", isEqualTo: groupId)
        .get()
        .then((value) {
      users = value;
    });
    var u = users.docs[0].data() as Map;

    // for (var i in u['members']) {
    //   sendPushNotification(
    //       i['userPushToken'],
    //       u['groupName'],
    //       u['groupPic'],
    //       chatMessageData['sender'],
    //       chatMessageData['type'] == 'texte'
    //           ? chatMessageData['message']
    //           : '📷');
    // }
  }

// pour avoir le Token Firebase messagessi,g d'un device

  Future<String> getFmToken() async {
    String? tmp;
    await fMessaging.requestPermission();
    await fMessaging.getToken().then((value) {
      if (value != null) {
        print(value);
        tmp = value;
      } else {
        tmp = '';
      }
    });

    return tmp!;
  }
}

// envoyer des notifications firebase

Future<void> sendPushNotification(String fmToken, String group, String image,
    String user, String message) async {
  try {
    var headers = {
      "Authorization":
          "key=AAAA_rCxGWA:APA91bFarlSM4Sg24gkGf-RLtsK_SpFgSzcNBkxucTJWHMhsR15BHlNGSdqjwhio8psmauqFwTEwjkjnJ0cXrJv4MQpg4zZJKIplHHiM8tLP9RhlcD_PXxyBLmexwTC4HsVGV_v_tdXZ",
      "Content-Type": "application/json; charset=UTF-8",
      "Accept": "application/json",
    };

    Map body = {
      "to": fmToken,
      "data": {
        "groupe": group,
        "image": image,
        "nom": '~ ' + user.capitalizeFirst!,
        "message": message,
      },
    };

    var url = Uri.parse(ApiEndponits().sendPushNotificationUrl);

    http.Response res = await http.post(url,
        body: utf8.encode(jsonEncode(body)), headers: headers);

    if (res.statusCode == 200) {
      print("notification sent successfully");
    } else {
      throw jsonDecode(res.body)['message'] ?? "unknown-error".tr;
    }
  } catch (e) {
    print(e);
  }
}

class ShowImage extends StatelessWidget {
  ShowImage({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: ColorHelper().black,
      child: Image.network(image),
    ));
  }
}
