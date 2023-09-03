//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  final ScrollController _controller = ScrollController();

  // notif() {
  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: 13,
  //           channelKey: 'basic_channel',
  //           title:
  //               'Emojis are awesome too! ${Emojis.activites_fireworks}  ${Emojis.activites_balloon}  ${Emojis.emotion_red_heart}',
  //           body:
  //               'Simple body with a bunch of Emojis! ${Emojis.transport_police_car} ${Emojis.animals_dog} ${Emojis.flag_UnitedStates} ${Emojis.person_baby}',
  //           color: ColorHelper().green,
  //           badge: 1,
  //           largeIcon: 'asset//assets/images/logo2.png',
  //           notificationLayout: NotificationLayout.Default
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: ElevatedButton(
                onPressed: (){}, child: Text('Lancer une notification')),
          ),
        ),
      ),
    );
  }
}
