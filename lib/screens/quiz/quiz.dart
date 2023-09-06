import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/screens/quiz/quiz_detail.dart';
import 'package:myskul/utilities/colors.dart';

class QuizWidget extends StatelessWidget {
  QuizWidget({required this.quiz});
  var quiz;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        Get.to(() => QuizDetail(quiz: this.quiz));
      },
      child: Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0x72ffffff),
          border: Border.all(
            color: quiz.done ? ColorHelper().grey.withOpacity(0.3) :  ColorHelper().green,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(12, 14, 0, 0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        quiz.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: quiz.done ? ColorHelper().grey.withOpacity(0.3) :  ColorHelper().green,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    FittedBox(
                      child: Text(
                        quiz.done ? "Ce quiz a déjà été passé" : " ",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: ColorHelper().grey
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 63.859649658203125,
                height: 80,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: quiz.done ? ColorHelper().grey.withOpacity(0.3) :  ColorHelper().green,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      quiz.score.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      quiz.nb_questions.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
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
