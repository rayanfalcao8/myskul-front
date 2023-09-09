import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
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
  Questions({required this.quiz});
  QuizModel quiz;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var couleurs = ColorHelper();

  var questions;

  var index = 0;

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  int questionDuration = 10;

  Question? displayQuestion(List<QuestionModel> questionList, int id) {
    // List<Widget> w = [];
    Question? w;
    var c = 1;
    questionList.forEach((element) {
      // if (c == questionList.length) {
      //   Get.to(Quiz5());
      // }

      if (element.id == id) {
        w = Question(
            question: element, position: c, total: questionList.length, duration: questionDuration,);
      }
      c += 1;
    });
    return w;
  }

  List<Answer>? displayAnswers(List<QuestionModel> questionList, int id) {
    List<Answer> w = [];
    questionList.forEach((element) {
      if (element.id == id) {
        element.answers.forEach((answer) {
          w.add(Answer(answer: answer));
        });
      }
    });
    return w;
  }

  getQuestions() async {
    questions = await QuizController().getQuestionsByTheme(widget.quiz.id);
    index = (questions[0] as QuestionModel).id;
    return questions;
  }

  onAnswer(questionList, id) {
    displayQuestion(questionList, id + 1);
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
                      future: getQuestions(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return NotFoundWidget(texte: 'Not Found');
                          } else {
                            Question? quest = displayQuestion(
                                snapshot.data as List<QuestionModel>, index);
                            if (quest == null) {
                              Get.to(Quiz5());
                            } else {
                              return quest;
                            }
                          }
                        }
                        return Center(
                            // child: CircularProgressIndicator(),
                            ); // Display the fetched data
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: FutureBuilder(
                  future: getQuestions(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return NotFoundWidget(texte: 'Not Found');
                      } else {
                        List<Answer>? answers = displayAnswers(
                            snapshot.data as List<QuestionModel>, index);
                        if (answers == null) {
                          // Get.to(Quiz5());
                          print("Pas de reponses");
                        } else {
                          return Column(
                            children: answers,
                          );
                        }
                      }
                    }
                    return Center(
                        // child: CircularProgressIndicator(),
                        ); // Display the fetched data
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
