import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:myskul/components/gender_box.dart';
import 'package:myskul/components/input_number.dart';
import 'package:myskul/controllers/auth/registration_controller.dart';
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/main.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/account/account_password.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/auth/terms.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class Chat extends StatefulWidget {
  Chat({required this.user, required this.group});
  User user;
  Map group;
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late Stream<QuerySnapshot> messageStream;

  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var messageController = TextEditingController();

  final ScrollController controller = ScrollController();

  void scrollDown(ScrollController ctrl) {
    if (ctrl.positions.isNotEmpty) {
      ctrl.animateTo(ctrl.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  File? imageFile;

  getMessageStream() {
    messageStream = FirebaseFirestore.instance
        .collection('messages')
        .where("groupId", isEqualTo: widget.group['groupId'])
        .orderBy("time")
        .snapshots();
  }

  // get image
  Future getImage() async {
    ImagePicker picker = ImagePicker();

    await picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        imageFile = File(value.path);
      }
    });

    imageFile = await cropImage(imageFile: imageFile!);

    if (imageFile != null) {
      uploadImage();
    } else {
      print("image null");
    }
  }
// crop image

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path, uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'edit-photo'.tr,
          toolbarColor: couleurs.green,
          activeControlsWidgetColor: couleurs.green,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'edit-photo'.tr,
      ),
      WebUiSettings(
        context: context,
      ),
    ]);
    if (croppedImage == null) {
      return null;
    }

    return File(croppedImage.path);
  }
// upload images

  Future uploadImage() async {
    String fileName = Uuid().v1();
    var ref =
        FirebaseStorage.instance.ref().child('images').child('{$fileName.jpg}');
    var uploadTask = await ref.putFile(imageFile!);

    var imageUrl = await uploadTask.ref.getDownloadURL();

    var tmp = {
      'message': imageUrl,
      'sender': widget.user.username,
      'senderImage': widget.user.profile_image,
      'type': 'image',
      'time': DateTime.now().microsecondsSinceEpoch.toString(),
      'groupId': widget.group['groupId']
    };
    imageUrl != ''
        ? ChatController().sendMessage(widget.group['groupId'], tmp)
        : null;
    messageController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    getMessageStream();
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
                padding: EdgeInsets.only(bottom: 80),
                margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height / 12),
                ),
                decoration: BoxDecoration(
                  color: couleurs.white.withOpacity(0.5),
                  image: DecorationImage(
                      image: AssetImage("assets/images/math.png"),
                      opacity: 0.04,
                      fit: BoxFit.cover),
                ),
                child: ChatController().chatMessages(
                    controller: controller,
                    chats: messageStream,
                    user: widget.user,
                    couleurs: couleurs,
                    textes: textes)),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
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
                              widget.group['groupName'],
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: couleurs.green,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20))),
                child: Row(children: [
                  Expanded(
                      child: TextFormField(
                    controller: messageController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: couleurs.white,
                    decoration: InputDecoration(
                      suffixIcon: Bounceable(
                        onTap: getImage,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                      hintText: "write-message".tr,
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  )),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      var tmp = {
                        'message': messageController.text,
                        'sender': widget.user.username,
                        'senderImage': widget.user.profile_image,
                        'type': 'texte',
                        'time':
                            DateTime.now().microsecondsSinceEpoch.toString(),
                        'groupId': widget.group['groupId']
                      };
                      messageController.text != ''
                          ? ChatController()
                              .sendMessage(widget.group['groupId'], tmp)
                          : scrollDown(controller);
                      messageController.clear();
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
