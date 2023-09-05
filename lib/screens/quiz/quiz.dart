import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/screens/quiz/quiz_detail.dart';

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
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0x72ffffff),
          border: Border.all(
            color: const Color(0xFF2BB799),
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
                    Text(
                      quiz.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2BB799),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      quiz.done ? "Deja fait" : "Allons y !!!",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 63.859649658203125,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff2bb799),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      quiz.score,
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
