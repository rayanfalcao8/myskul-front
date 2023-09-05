import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:myskul/screens/quiz/quiz_list.dart' as q;
import 'package:myskul/screens/quiz/quiz_list.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';

import '../../models/quiz.dart';
import '../chat/chat.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({required this.category});
  var category;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        Get.to(() => QuizList(category: this.category));
      },
      child: Container(
        width: double.infinity,
        height: 81,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0x72000000),
        ),
        margin: EdgeInsets.only(bottom: 17),
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
              category.displayText ?? "Default",
              style: TextHelper().h4r.copyWith(color: ColorHelper().white),
            ),
          ),
        ),
      ),
    );
  }
}
