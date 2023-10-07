import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';

class SentMessage extends StatefulWidget {
  SentMessage({
    required this.texte,
    required this.image,
    required this.nom,
    required this.time,
  });

  final String texte;
  final String image;
  final String nom;
  final String time;

  @override
  State<SentMessage> createState() => _SentMessageState();
}

class _SentMessageState extends State<SentMessage> {
  late DateTime time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.time));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "${time.hour}:${time.minute}",
              style: TextHelper().bodyTextr.copyWith(fontSize: 10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                              bottomRight: Radius.circular(10),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReceivedMessage extends StatefulWidget {
  const ReceivedMessage({
    required this.texte,
    required this.image,
    required this.nom,
    required this.time,
  });

  final String texte;
  final String image;
  final String nom;
  final String time;

  @override
  State<ReceivedMessage> createState() => _ReceivedMessageState();
}

class _ReceivedMessageState extends State<ReceivedMessage> {
  late DateTime time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.time));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "${time.hour}:${time.minute}",
              style: TextHelper().bodyTextr.copyWith(fontSize: 10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, bottom: 20),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          '~' + widget.nom,
                          style: TextHelper().bodyTextr.copyWith(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 05,
                      ),
                      Text(
                        widget.texte,
                        style: TextHelper().h4r,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
            FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: AssetImage('assets/images/404.png'),
              width: 200,
            ),
            SizedBox(
              height: 05,
            ),
            Text(
              texte,
              textAlign: TextAlign.center,
              style: TextHelper()
                  .h3b
                  .copyWith(color: ColorHelper().black.withOpacity(0.5)),
            )
          ],
        )),
      ],
    );
  }
}

class NotFoundAiWidget extends StatelessWidget {
  const NotFoundAiWidget({
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
            Image.asset('assets/images/bot.png', width: 200,),
            SizedBox(
              height: 05,
            ),
            Text(
              texte,
              textAlign: TextAlign.center,
              style: TextHelper()
                  .h4b
                  .copyWith(color: ColorHelper().black.withOpacity(0.5)),
            )
          ],
        )),
      ],
    );
  }
}

class SentImage extends StatefulWidget {
  const SentImage({
    required this.tmp,
    required this.user,
  });

  final Map tmp;
  final User user;

  @override
  State<SentImage> createState() => _SentImageState();
}

class _SentImageState extends State<SentImage> {
  late DateTime time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.tmp['time']));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "${time.hour}:${time.minute}",
            style: TextHelper().bodyTextr.copyWith(fontSize: 10),
          ),
        ),
        Container(
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
                      Get.to(() => ShowImage(image: widget.tmp['message']));
                    },
                    child: FadeInImage(
                        placeholder: AssetImage('assets/images/loading1.gif'),
                        image: NetworkImage(widget.tmp['message']))),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(widget.tmp['senderImage']),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReceivedImage extends StatefulWidget {
  ReceivedImage({
    required this.tmp,
  });

  final Map tmp;

  @override
  State<ReceivedImage> createState() => _ReceivedImageState();
}

class _ReceivedImageState extends State<ReceivedImage> {
  late DateTime time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.tmp['time']));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "${time.hour}:${time.minute}",
            style: TextHelper().bodyTextr.copyWith(fontSize: 10),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(widget.tmp['senderImage']),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        '~' + widget.tmp['sender'],
                        style: TextHelper().bodyTextr.copyWith(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 05,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => ShowImage(image: widget.tmp['message']));
                        },
                        child: FadeInImage(
                            placeholder:
                                AssetImage('assets/images/loading1.gif'),
                            image: NetworkImage(widget.tmp['message']))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReceivedAiMessage extends StatefulWidget {
  const ReceivedAiMessage({
    required this.texte,
  });

  final String texte;

  @override
  State<ReceivedAiMessage> createState() => _ReceivedAiMessageState();
}

class _ReceivedAiMessageState extends State<ReceivedAiMessage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () async {
        // await Clipboard.setData(ClipboardData(text: widget.texte.trim()));
        // EasyLoading.showInfo('cp-to-cb'.tr);

        Clipboard.setData(ClipboardData(text: widget.texte.trim())).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('cp-to-cb'.tr)));
        });
        // copied successfully
      },
      child: Align(
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
                backgroundImage: AssetImage('assets/images/logo2.png'),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.texte.trim(),
                      style: TextHelper().h4r,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SentAiMessage extends StatefulWidget {
  SentAiMessage({
    required this.texte,
    required this.image,
    required this.nom,
  });

  final String texte;
  final String image;
  final String nom;

  @override
  State<SentAiMessage> createState() => _SentAiMessageState();
}

class _SentAiMessageState extends State<SentAiMessage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 10, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
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
          ],
        ),
      ),
    );
  }
}
