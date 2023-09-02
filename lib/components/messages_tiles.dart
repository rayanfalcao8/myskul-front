import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:audioplayers/audioplayers.dart';

class SentMessage extends StatefulWidget {
  SentMessage({
    required this.texte,
    required this.image,
    required this.nom,
  });

  final String texte;
  final String image;
  final String nom;

  @override
  State<SentMessage> createState() => _SentMessageState();
}

class _SentMessageState extends State<SentMessage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Text(
            //         widget.nom,
            //         style: widget.textes.h4r,
            //         overflow: TextOverflow.clip,
            //       ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 250,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorHelper().green.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Text(
                widget.texte,
                style: TextHelper().h4r,
                overflow: TextOverflow.clip,
              ),
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(widget.image),
            ),
          ],
        ),
      ),
    );
  }
}

class ReceivedMessage extends StatefulWidget {
  const ReceivedMessage({
    required this.texte,
    required this.image,
    required this.nom,
  });


  final String texte;
  final String image;
  final String nom;

  @override
  State<ReceivedMessage> createState() => _ReceivedMessageState();
}

class _ReceivedMessageState extends State<ReceivedMessage> {


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
              backgroundImage: NetworkImage(widget.image),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 250,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorHelper().grey.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                widget.texte,
                style: TextHelper().h4r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    required this.texte,
  });


  final String texte;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: (MediaQuery.of(context).size.height / 4)),
        Center(
            child: Column(
          children: [
            Image.asset(
              "assets/images/404.png",
              width: 200,
            ),
            SizedBox(
              height: 05,
            ),
            Text(
              texte,
              style:
                  TextHelper().h3b.copyWith(color: ColorHelper().black.withOpacity(0.5)),
            )
          ],
        )),
      ],
    );
  }
}

class SentImage extends StatelessWidget {
  const SentImage({
    required this.tmp,
    required this.user,
  });

  final Map tmp;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 150,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: ColorHelper().green.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: InkWell(
                onTap: () {
                  Get.to(() => ShowImage(image: tmp['message']));
                },
                child: FadeInImage(
                    placeholder: AssetImage('assets/images/loading1.gif'),
                    image: NetworkImage(tmp['message']))),
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(tmp['senderImage']),
          ),
        ],
      ),
    );
  }
}

class ReceivedImage extends StatelessWidget {
  const ReceivedImage({
    required this.tmp,
    required this.user,
  });

  final Map tmp;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(tmp['senderImage']),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 150,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: ColorHelper().grey.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: InkWell(
                onTap: () {
                  Get.to(() => ShowImage(image: tmp['message']));
                },
                child: FadeInImage(
                    placeholder: AssetImage('assets/images/loading1.gif'),
                    image: NetworkImage(tmp['message']))),
          ),
        ],
      ),
    );
  }
}
