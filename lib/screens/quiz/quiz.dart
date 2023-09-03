import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/screens/quiz/quiz_2.dart';

import '../../models/quiz.dart';
import '../chat/chat.dart';

class QuizWidget extends StatelessWidget {
  QuizWidget({required this.quiz});

  QuizModel quiz;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        Get.to(() => Quiz2());
      },
      child: Container(
        width: double.infinity,
        height: 81,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0x72000000),
        ),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(.28),
              radius: 32,
              child: const Icon(
                Icons.toc_outlined,
                color: Colors.white,
              ),
            ),
            title: Text(
              quiz.name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
