import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/screens/quiz/quiz_3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myskul/models/quiz.dart';
import 'package:myskul/screens/quiz/question.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';
import '../../components/messages_tiles.dart';
import '../../controllers/quiz_controller.dart';
import '../../models/question.dart';

class Questions extends StatefulWidget {
  Questions(
      {required this.quiz,
      required this.index,
      required this.current,
      this.mod});
  QuizModel quiz;
  int index;
  int? mod;
  List<Map<String, dynamic>> current;

  late int firstId;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var couleurs = ColorHelper();

  var answerColor = Colors.black.withOpacity(.24);

  var answered = false;

  var questions;

  Widget questionsWidget = Center();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  int questionDuration = 30;

  var score;

  var wrong;

  late Timer timer;

  late int start;

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
    score = await prefs.getInt('currentScore')!;
  }

  getWrongScore() async {
    final SharedPreferences prefs = await _prefs;
    wrong = await prefs.getInt('wrongScore')!;
  }

  void startTimer() async {
    const oneSec = const Duration(seconds: 1);
    var tmp = widget.index + 1;
    var tmp2 = await questions as List<QuestionModel>;
    ChatController().playLocalAudio('start.mp3');
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
            if (tmp == tmp2.length + 1) {
              setScore(0);
              setWrongScore(1);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Quiz3(
                  questionsLength: tmp2.length,
                  quiz: widget.quiz,
                  current: widget.current,
                );
              }));
            } else {
              setScore(0);
              setWrongScore(1);

              widget.current
                  .add({"question_id": tmp2[tmp - 1].id, "status": false});

              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Questions(
                    quiz: widget.quiz,
                    index: tmp,
                    current: widget.current,
                  ),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            }
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  getQuestions() async {
    List<QuestionModel> questions =
        await QuizController().getQuestionsByTheme(widget.quiz.id);
    widget.firstId = (questions[0]).id;
    return questions;
  }

  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration.zero, (() {
      getScore();
      getWrongScore();
    }));

    questions = getQuestions();
    start = questionDuration;
    widget.mod == 1 ? startTimer() : null;
    super.initState();
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo-blanc.png',
                        width: 150,
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
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
                              questionsWidget
                            ],
                          ),
                        ),
                        SizedBox(),
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

                            return Column(
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
                                        margin: const EdgeInsets.only(top: 150),
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
                                            widget.mod == 1
                                                ? start.toString()
                                                : '/',
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
                                    height: MediaQuery.of(context).size.height /
                                        1.4,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          tmp[widget.index - 1].answers.length +
                                              1,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            tmp[widget.index - 1]
                                                .answers
                                                .length) {
                                          return answered == true
                                              ? Column(
                                                  children: [
                                                    SizedBox(height: 20),
                                                    NewButtonG(
                                                      text: 'next',
                                                      function: () async {
                                                        var tmp2 =
                                                            widget.index + 1;

                                                        if (tmp2 ==
                                                            tmp.length + 1) {
                                                          EasyLoading.show();
                                                          await Future.delayed(
                                                              Duration(
                                                                  seconds: 1));
                                                          EasyLoading.dismiss();

                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return Quiz3(
                                                              questionsLength:
                                                                  tmp.length,
                                                              quiz: widget.quiz,
                                                              current: widget
                                                                  .current,
                                                            );
                                                          }));
                                                        } else {
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            PageRouteBuilder(
                                                              pageBuilder: (context,
                                                                      animation1,
                                                                      animation2) =>
                                                                  Questions(
                                                                quiz:
                                                                    widget.quiz,
                                                                index: tmp2,
                                                                current: widget
                                                                    .current,
                                                              ),
                                                              transitionDuration:
                                                                  Duration.zero,
                                                              reverseTransitionDuration:
                                                                  Duration.zero,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    )
                                                  ],
                                                )
                                              : Center();
                                        } else {
                                          return InkWell(
                                              onTap: () async {
                                                if (answered == false) {
                                                  if (tmp[widget.index - 1]
                                                          .answers[index]
                                                          .isCorrect ==
                                                      true) {
                                                    setScore(1);
                                                    setWrongScore(0);
                                                    widget.current.add({
                                                      "question_id":
                                                          tmp[widget.index - 1]
                                                              .id,
                                                      "status": true
                                                    });
                                                    await EasyLoading
                                                        .showSuccess(
                                                            "correct-a".tr);

                                                    ChatController()
                                                        .playLocalAudio(
                                                            'right-answer.wav');

                                                    // await Future.delayed(
                                                    //     Duration(seconds: 1));
                                                  } else {
                                                    setScore(0);
                                                    setWrongScore(1);
                                                    widget.current.add({
                                                      "question_id":
                                                          tmp[widget.index - 1]
                                                              .id,
                                                      "status": false
                                                    });
                                                    await EasyLoading.showError(
                                                        "wrong-a".tr);

                                                    ChatController()
                                                        .playLocalAudio(
                                                            'wrong-answer.wav');

                                                    // await Future.delayed(
                                                    //     Duration(seconds: 1));
                                                  }
                                                } else {
                                                  ChatController()
                                                      .playLocalAudio(
                                                          'pop.mp3');
                                                }

                                                answered = true;
                                                widget.mod == 1
                                                    ? timer.cancel()
                                                    : null;
                                                questionsWidget = Row(
                                                  children: [
                                                    AnimatedOpacity(
                                                      opacity: 1.0,
                                                      duration: const Duration(
                                                          seconds: 2),
                                                      child: InkWell(
                                                        onTap: () {
                                                          showAlertDialog(
                                                              context: context,
                                                              text: tmp[widget
                                                                          .index -
                                                                      1]
                                                                  .justification,
                                                              quiz:
                                                                  widget.quiz);
                                                        },
                                                        child: Icon(
                                                          Icons.question_mark,
                                                          color: couleurs.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    )
                                                  ],
                                                );
                                                setState(() {});
                                              },
                                              child: AnimatedOpacity(
                                                opacity: 1.0,
                                                duration:
                                                    const Duration(seconds: 2),
                                                child: Answer(
                                                  answer: tmp[widget.index - 1]
                                                      .answers[index],
                                                  color: answered == false
                                                      ? answerColor
                                                      : tmp[widget.index - 1]
                                                              .answers[index]
                                                              .isCorrect
                                                          ? couleurs.green
                                                          : couleurs.red,
                                                ),
                                              ));
                                        }
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
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(
    {required BuildContext context,
    required String text,
    required QuizModel quiz}) {
  // show the dialog
  showDialog(
      context: Get.context as BuildContext,
      builder: (context) => CupertinoAlertDialog(
            title: Text("Justification"),
            content: Text(text, style: TextHelper().h4l),
          ));
}
