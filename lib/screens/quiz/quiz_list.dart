import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:myskul/controllers/quiz_controller.dart';
import 'package:myskul/controllers/subscripiton_controller.dart';
import 'package:myskul/screens/quiz/quiz.dart';

import '../../components/messages_tiles.dart';
import '../../models/category.dart';
import '../../models/quiz.dart';
import '../../utilities/colors.dart';
import '../../utilities/gradients.dart';
import '../../utilities/icons.dart';
import '../../utilities/texts.dart';

class QuizList extends StatefulWidget {
  QuizList({required this.category, this.name});
  Category category;
  String? name;
  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  var controller = TextEditingController();

  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  var categories;

  List subList = [];

  List<Widget> displayQuizzes(List<QuizModel> quizList) {
    List<QuizWidget> w = [];
    int index = 0;
    quizList.forEach((element) {
      if (subList.length >= 2) {
        w.add(QuizWidget(
          quiz: element,
          isActive: true,
        ));
      } else {
        if (index <= 2) {
          w.add(QuizWidget(
            quiz: element,
            isActive: true,
          ));
        } else {
          w.add(QuizWidget(
            quiz: element,
            isActive: false,
          ));
        }
      }

      index++;
    });
    return w;
  }

  getCategories() {
    categories =
        QuizController().getQuizzesByCategory(widget.category.id, widget.name);
  }

  getSubList() async {
    subList = await SubscriptionController.getAll();
    setState(() {});
    print("sublist ${subList.length}");
  }

  @override
  void initState() {
    super.initState();
    getCategories();
    Future.delayed(Duration.zero, (() async {
      await getSubList();
    }));
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
                          controller: controller,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.send,
                          cursorColor: ColorHelper().black,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: couleurs.grey.withOpacity(0.1),
                            prefixIcon: Icon(
                              Icons.search,
                              color: couleurs.black,
                            ),
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
                          onSubmitted: (v) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => QuizList(
                                          category: widget.category,
                                          name: v,
                                        )));
                          },
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
                                future: categories,
                                builder: (context, snapshot) {
                                  try {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return NotFoundWidget(
                                            texte: 'not-found'.tr);
                                      } else {
                                        return snapshot.data != null
                                            ? Column(
                                                children: displayQuizzes(
                                                    snapshot.data
                                                        as List<QuizModel>),
                                              )
                                            : Center(
                                                child: Text(
                                                'not-found'.tr,
                                                style: textes.h3r,
                                              ));
                                      }
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: couleurs.green,
                                      ),
                                    ); // Display the fetched data
                                  } catch (e) {
                                    return Center(
                                        child: Text(
                                      e.toString(),
                                      style: textes.h3r,
                                    ));
                                  }
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
