import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/components/button_g.dart';
import 'package:myskul/screens/quiz/quiz_detail.dart';
import 'package:myskul/screens/subscriptions/subscription_form.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:myskul/utilities/texts.dart';

class QuizWidget extends StatelessWidget {
  QuizWidget({required this.quiz, this.isActive});
  var quiz;
  bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        isActive == true
            ? Get.to(() => QuizDetail(quiz: this.quiz))
            : Get.bottomSheet(
                Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 150,
                          width: 500,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/phone.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Text(
                            'pay-text'.tr,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        NewButtonG(text: 'pay-process'.tr, function: () {
                          Get.to(()=>SubscriptionForm());
                        },),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    )),
              );
      },
      child: Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0x72ffffff),
          border: Border.all(
            color: quiz.done
                ? ColorHelper().grey.withOpacity(0.3)
                : ColorHelper().green,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 14, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onLongPress: () {
                        showAlertDialog(context, quiz.name);
                      },
                      child: Text(
                        quiz.name,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: quiz.done
                              ? ColorHelper().grey.withOpacity(0.3)
                              : ColorHelper().green,
                        ),
                        overflow: TextOverflow.ellipsis,
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
                            color: ColorHelper().grey),
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
                  color: quiz.done
                      ? ColorHelper().grey.withOpacity(0.3)
                      : ColorHelper().green,
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

showAlertDialog(BuildContext context, String text) {
  // show the dialog
  showDialog(
      context: Get.context as BuildContext,
      builder: (context) => CupertinoAlertDialog(
            content: Text(text),
          ));
}
