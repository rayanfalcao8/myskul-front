import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/models/question.dart';

import 'quiz_5.dart';

class Question extends StatelessWidget {
  Question({
    required this.question,
    required this.position,
    required this.total,
    required this.duration,
  });
  var question;
  var total;
  var position;
  var duration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 200),
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 21,
                      ),
                      Row(
                        children: [
                          const Text(
                            "05",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 50,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xff17bf27),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 50,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "04",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        "QUESTION :  ${position.toString()}/${total.toString()}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2BB799),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        question.name,
                        // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis purus, blandit ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.2,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 150),
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
                child: Center(
                  child: Text(
                    position.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Answer extends StatelessWidget {
  Answer({this.answer});
  var answer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(Quiz5());
      },
      child: Container(
        width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(.24),
            width: 2,
          ),
        ),
        child: Text(
          // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis purus, blandit ?",
          answer.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
            height: 1.7,
          ),
        ),
      ),
    );
    // ListView(
    //   physics: const BouncingScrollPhysics(),
    //   children: [
    //     Container(
    //       width: double.infinity,
    //       padding: const EdgeInsets.symmetric(vertical: 8),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: Colors.white,
    //         border: Border.all(
    //           color: Colors.red,
    //           width: 2,
    //         ),
    //       ),
    //       child: const Text(
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis purus, blandit ?",
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //           fontSize: 12,
    //           fontWeight: FontWeight.w200,
    //           height: 1.7,
    //         ),
    //       ),
    //     ),
    //     const SizedBox(
    //       height: 11,
    // ),
    //   Container(
    //     width: double.infinity,
    //     padding: const EdgeInsets.symmetric(vertical: 8),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       color: Colors.white,
    //       border: Border.all(
    //         color: Colors.black.withOpacity(.24),
    //         width: 2,
    //       ),
    //     ),
    //     child: const Text(
    //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis purus, blandit ?",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         fontSize: 12,
    //         fontWeight: FontWeight.w200,
    //         height: 1.7,
    //       ),
    //     ),
    //   ),
    //   const SizedBox(
    //     height: 11,
    //   ),
    //   Container(
    //     width: double.infinity,
    //     padding: const EdgeInsets.symmetric(vertical: 8),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       color: Colors.white,
    //       border: Border.all(
    //         color: Colors.black.withOpacity(.24),
    //         width: 2,
    //       ),
    //     ),
    //     child: const Text(
    //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis purus, blandit ?",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         fontSize: 12,
    //         fontWeight: FontWeight.w200,
    //         height: 1.7,
    //       ),
    //     ),
    //   ),
    //   const SizedBox(
    //     height: 11,
    //   ),
    //   Container(
    //     width: double.infinity,
    //     padding: const EdgeInsets.symmetric(vertical: 8),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       color: Colors.white,
    //       border: Border.all(
    //         color: Colors.green,
    //         width: 2,
    //       ),
    //     ),
    //     child: const Text(
    //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis purus, blandit ?",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         fontSize: 12,
    //         fontWeight: FontWeight.w200,
    //         height: 1.7,
    //       ),
    //     ),
    //   ),
    //   ],
    // ),
    // );
  }
}
