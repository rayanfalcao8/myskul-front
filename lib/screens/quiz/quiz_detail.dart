import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/screens/quiz/questions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/colors.dart';
import '../../utilities/texts.dart';
import '../../utilities/gradients.dart';
import '../../utilities/icons.dart';

class QuizDetail extends StatefulWidget {
  QuizDetail({required this.quiz});
  var quiz;
 

  @override
  State<QuizDetail> createState() => _QuizDetailState();
}

class _QuizDetailState extends State<QuizDetail> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    // TODO: implement initState
    initializeScore();
  }

  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  int questionDuration = 30;

  initializeScore() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('currentScore', 0);
    prefs.setInt('wrongScore', 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Center(
                                child: Text(
                                  widget.quiz.name,
                                  style:
                                      textes.h4l.copyWith(color: couleurs.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 150),
                            width: MediaQuery.of(context).size.width,
                            height: 240,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Color.fromARGB(0, 0, 0, 0), width: 2.0),
                              border: Border.all(
                                color: const Color(0xFF2BB799),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                ListTile(
                                  title: Text(
                                    "q-number".tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  trailing: Text(
                                    widget.quiz.nb_questions.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    widget.quiz.done
                                        ? "p-score".tr
                                        : "never-tried".tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  trailing: Text(
                                    widget.quiz.done
                                        ? widget.quiz.score.toString()
                                        : "/",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "quiz-d".tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  trailing: Text(
                                    (widget.quiz.nb_questions *
                                                questionDuration)
                                            .toString() +
                                        " Sec",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 90),
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff22987F), Color(0xff2BB799)],
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.event_note_outlined,
                                color: Colors.white,
                                size: 58,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      SizedBox(
                        width: 270,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            Get.to(() => Questions(
                                  quiz: widget.quiz,
                                  index: 1,
                                  current: [],
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                Text(
                                  "start".tr,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    color: Color(0xFF22987F),
                                    size: 24,
                                  ),
                                )
                              ],
                            ),
                          ),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF22987F)),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            )),
                          ),
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
    );
  }
}
