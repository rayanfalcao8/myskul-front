import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myskul/models/quiz.dart';
import 'package:myskul/screens/quiz/question.dart';
import 'package:myskul/screens/quiz/quiz_5.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import '../../components/messages_tiles.dart';
import '../../controllers/quiz_controller.dart';
import '../../models/question.dart';

class Questions extends StatefulWidget {
  Questions({required this.quiz, required this.index});
  QuizModel quiz;
  int index;
  late int firstId;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var couleurs = ColorHelper();

  var questions;

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  int questionDuration = 30;

  var score ;

  var wrong ;

  late Timer _timer;

  late int _start;

  setScore(int num) async {
    final SharedPreferences prefs = await _prefs;
    int tmp = await prefs.getInt('currentScore')!;
    prefs.setInt('currentScore', num + tmp);
  }

  setWrongScore(int num) async {
    final SharedPreferences prefs = await _prefs;
    int tmp = await prefs.getInt('wrongScore')!;
    prefs.setInt('wrongScore', num + tmp);
  }

  getScore() async {
    final SharedPreferences prefs = await _prefs;
    int tmp = await prefs.getInt('currentScore')!;
    return tmp;
  }

  getWrongScore() async {
    final SharedPreferences prefs = await _prefs;
    int tmp = await prefs.getInt('wrongScore')!;
    return tmp;
  }

  void startTimer() async {
    const oneSec = const Duration(seconds: 1);
    var tmp = widget.index + 1;
    var tmp2 = await questions as List<QuestionModel>;

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            if (tmp == tmp2.length) {
              setScore(0);
              setWrongScore(1);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Quiz5(
                    questionsLength: tmp2.length, quizName: widget.quiz.name);
              }));
            } else {
              setScore(0);
              setWrongScore(1);
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      Questions(quiz: widget.quiz, index: tmp),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            }
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  getQuestions() async {
    List<QuestionModel> questions =
        await QuizController().getQuestionsByTheme(widget.quiz.id);
    widget.firstId = (questions[0] as QuestionModel).id;
    return questions;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // () async {
    //   score = await getScore();
    //   wrong = await getWrongScore();
    // };

    questions = getQuestions();
    _start = questionDuration;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: couleurs.white.withOpacity(0.5),
            image: DecorationImage(
                image: AssetImage("assets/images/math.png"),
                opacity: 0.04,
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 274,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff22987f), Color(0xff2bb799)],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 0,
                    child: Column(
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
                            SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: FutureBuilder(
                      future: questions,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return NotFoundWidget(texte: 'Not Found');
                          } else {
                            List<QuestionModel> tmp =
                                snapshot.data as List<QuestionModel>;

                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Question(
                                        question: tmp[widget.index - 1],
                                        position: widget.index,
                                        total: tmp.length,
                                        correct: score,
                                        wrong: wrong,
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 150),
                                          height: 100,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xff22987F),
                                                Color(0xff2BB799)
                                              ],
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              _start.toString(),
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.3,
                                      child: ListView.builder(
                                        itemCount: tmp[widget.index - 1]
                                            .answers
                                            .length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              onTap: () async {
                                                if (tmp[widget.index - 1]
                                                        .answers[index]
                                                        .isCorrect ==
                                                    true) {
                                                  setScore(1);
                                                  setWrongScore(0);
                                                  await EasyLoading.showSuccess;
                                                } else {
                                                  await EasyLoading.showError;
                                                }

                                                var tmp2 = widget.index + 1;

                                                if (tmp2 == tmp.length + 1) {
                                                  EasyLoading.show();
                                                  await Future.delayed(
                                                      Duration(seconds: 5));
                                                  EasyLoading.dismiss();
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return Quiz5(
                                                        questionsLength:
                                                            tmp.length,
                                                        quizName:
                                                            widget.quiz.name);
                                                  }));
                                                } else {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation1,
                                                              animation2) =>
                                                          Questions(
                                                              quiz: widget.quiz,
                                                              index: tmp2),
                                                      transitionDuration:
                                                          Duration.zero,
                                                      reverseTransitionDuration:
                                                          Duration.zero,
                                                    ),
                                                  );
                                                }
                                              },
                                              child: Answer(
                                                  answer: tmp[widget.index - 1]
                                                      .answers[index]));
                                        },
                                      )),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 14),
                                  //   child: Column(
                                  //     children: answers!,
                                  //   ),
                                  // ),
                                ],
                              ),
                            );
                          }
                        }
                        return Center(
                            // child: CircularProgressIndicator(
                            //   color: Colors.amber,
                            // ),
                            ); // Display the fetched data
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String text, bool isCorrect) {
  // show the dialog
  showDialog(
      context: Get.context as BuildContext,
      builder: (context) => CupertinoAlertDialog(
            title: isCorrect
                ? Text("correct-a".tr, style: TextHelper().h1r)
                : Text("wrong-a".tr, style: TextHelper().h1r),
            content: Text(text, style: TextHelper().h4l),
            actions: [
              CupertinoButton.filled(
                  child: Text("ok".tr),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ));
}
