import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myskul/controllers/quiz_controller.dart';
import 'package:myskul/screens/quiz/quiz.dart';

import '../../components/messages_tiles.dart';
import '../../models/category.dart';
import '../../models/quiz.dart';
import '../../utilities/colors.dart';
import '../../utilities/gradients.dart';
import '../../utilities/icons.dart';
import '../../utilities/texts.dart';
import 'category.dart';

class QuizList extends StatefulWidget {
  QuizList({required this.category});
  Category category;
  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  List<Widget> displayQuizzes(List<QuizModel> quizList) {
    List<QuizWidget> w = [];
    quizList.forEach((element) {
      w.add(QuizWidget(quiz: element));
    });
    return w;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
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
                                  'quiz'.tr,
                                  style:
                                      textes.h2l.copyWith(color: couleurs.white),
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
      
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                        color: couleurs.white.withOpacity(0.5),
                        image: DecorationImage(
                            image: AssetImage("assets/images/math.png"),
                            opacity: 0.04,
                            fit: BoxFit.cover),
                      ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 28,
                        ),
                        TextField(
                            cursorColor: ColorHelper().black ,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: couleurs.grey.withOpacity(0.1),
                              prefixIcon:  Icon(Icons.search, color: couleurs.black,),
                              hintText: "search".tr,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "quiz-text".tr,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              FutureBuilder(
                                future: QuizController()
                                    .getQuizzesByCategory(widget.category.id),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasError) {
                                      print(snapshot.error);
                                      return NotFoundWidget(texte: 'not-found'.tr);
                                    } else {
                                      return Column(
                                        children: displayQuizzes(
                                            snapshot.data as List<QuizModel>),
                                      );
                                    }
                                  }
                                  return Center(
                                      child: CircularProgressIndicator(color: couleurs.green,),
                                      ); // Display the fetched data
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
