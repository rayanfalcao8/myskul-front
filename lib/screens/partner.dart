import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';

class Partner extends StatefulWidget {
  @override
  State<Partner> createState() => _PartnerState();
}

class _PartnerState extends State<Partner> {
  late Stream<QuerySnapshot> messageStream;

  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  Future<void> launchUrl2(String url) async {
    if (!await launch(url)) {
      throw Exception('Could not launch $url');
    }
  }

  showAlertDialog(BuildContext context, String url) {
    // show the dialog
    showDialog(
        context: Get.context as BuildContext,
        builder: (context) => CupertinoAlertDialog(
              title: Text("warning".tr, style: TextHelper().h1r),
              content: Text("warning-leave".tr, style: TextHelper().h4l),
              actions: [
                CupertinoButton.filled(
                  borderRadius: BorderRadius.zero,
                    child: Text("yes".tr),
                    onPressed: () {
                      Navigator.pop(context);
                      launchUrl2(url);
                    }),
              ],
            ));
  }

  List<Map<String, String>> partners = [
    {
      'name': 'ORANGE CAMEROUN',
      'image': 'om.png',
      'link': 'https://www.orange.cm/fr/',
    },
    {
      'name': 'MTN CAMEROUN',
      'image': 'momo.png',
      'link': 'https://mtn.cm/fr/',
    },
    {
      'name': 'FACULTÉ DE MÉDECINE ET DES SCIENCES PHARMACEUTIQUES DE DOUALA',
      'image': 'douala.jpg',
      'link': 'https://www.fmsp-udo.com/',
    },
    {
      'name': 'FACULTÉ DE MÉDECINE ET DES SCIENCES DE DSCHANG',
      'image': 'dschang.png',
      'link': 'https://www.univ-dschang.org/fmsp/',
    },
    {
      'name': 'FACULTÉ DE MÉDECINE ET DES SCIENCES BIOMÉDICALE DE GAROUA',
      'image': 'garoua.jpg',
      'link': 'https://www.osidimbea-edu.cm/superieur/garoua/fmsb-garoua/',
    },
    {
      'name': 'BMS FOUNDATION',
      'image': 'bmsf.jpeg',
      'link':
          'https://www.facebook.com/FondationBMS/posts/d41d8cd9/2494969947436652/?locale=sw_KE',
    },
    {
      'name': 'BMS STYLE',
      'image': 'bmss.jpeg',
      'link':
          'https://www.facebook.com/FondationBMS/posts/bms-style%EF%B8%8F%EF%B8%8F/2818344301765880/?locale=ms_MY',
    },
    {
      'name': 'MUCOTECH SARL',
      'image': 'mucotech.jpeg',
      'link': 'https://www.youtube.com/channel/UC1k_nAPWq9tBO3YPUbOR3PA',
    },
    {
      'name': 'DIGIHEALTH SARL',
      'image': 'digih.jpeg',
      'link': 'https://www.youtube.com/channel/UCoPaZnTialRvTDbCSTG8dkg',
    },
    // {'name': 'FLASH ART', 'image': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: 20,
              ),
              decoration: BoxDecoration(
                color: couleurs.white.withOpacity(0.5),
                image: DecorationImage(
                    image: AssetImage("assets/images/math.png"),
                    opacity: 0.04,
                    fit: BoxFit.cover),
              ),
              child: AnimationLimiter(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: partners.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Bounceable(
                            onTap: () {
                              showAlertDialog(
                                  context, partners[index]['link']!);
                            },
                            child: Container(
                              height: 150,
                              margin:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              decoration: BoxDecoration(
                                  gradient: gradients.greenGradient),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/images/${partners[index]['image']!}'))),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height: MediaQuery.of(context).size.height,
                                    child: Center(
                                      child: Text(
                                        partners[index]['name']!,
                                        style: TextHelper().bodyTextl.copyWith(
                                            color: couleurs.white,
                                            wordSpacing: 1),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                  SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).size.height / 12,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 30,
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
                              'our-part'.tr,
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
