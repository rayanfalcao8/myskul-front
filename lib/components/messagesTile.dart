import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:audioplayers/audioplayers.dart';

class SentMessage extends StatefulWidget {
  SentMessage({
    super.key,
    required this.couleurs,
    required this.textes,
    required this.texte,
    required this.image,
    required this.nom,
  });

  final ColorHelper couleurs;
  final TextHelper textes;
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
                maxWidth: 250,),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widget.couleurs.green.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Text(
                widget.texte,
                style: widget.textes.h4r,
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
    super.key,
    required this.couleurs,
    required this.textes,
    required this.texte,
    required this.image,
    required this.nom,
  });

  final ColorHelper couleurs;
  final TextHelper textes;
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
                maxWidth: 250,),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widget.couleurs.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                widget.texte,
                style: widget.textes.h4r,
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
    super.key,
    required this.textes,
    required this.couleurs,
    required this.texte,
  });

  final TextHelper textes;
  final String texte;
  final ColorHelper couleurs;

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
                  textes.h3b.copyWith(color: couleurs.black.withOpacity(0.5)),
            )
          ],
        )),
      ],
    );
  }
}

class SentImage extends StatelessWidget {
  const SentImage({
    super.key,
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
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            alignment:  Alignment.centerRight,
            constraints: BoxConstraints(
                maxWidth: 250, minWidth: 150, minHeight: 150, maxHeight: 250),
            child: InkWell( onTap: () {
              Get.to(()=>ShowImage(image: tmp['message']));
            },child: FadeInImage(placeholder: AssetImage('assets/images/loading.gif'), image: NetworkImage(tmp['message']))),
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
    super.key,
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
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            alignment:  Alignment.centerLeft,
            constraints: BoxConstraints(
                maxWidth: 250, minWidth: 150, minHeight: 150, maxHeight: 250),
            child: InkWell(
              onTap: (){
                Get.to(()=>ShowImage(image: tmp['message']));
              },
              child: FadeInImage(placeholder: AssetImage('assets/images/loading.gif'), image: NetworkImage(tmp['message']))), 
          ),
          
        ],
      ),
    );
  }
}

