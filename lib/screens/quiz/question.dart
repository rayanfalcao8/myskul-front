import 'dart:async';

import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question({
    required this.question,
    required this.position,
    required this.total,
    required this.correct,
    required this.wrong,
  });
  var question;
  var total;
  var position;
  var correct;
  var wrong;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  double c = 100;

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
                          Text(
                            widget.correct.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: (widget.correct * 100) / widget.total,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xff17bf27),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: (widget.wrong * 100) / widget.total,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.wrong.toString(),
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
                        "QUESTION :  ${widget.position.toString()}/${widget.total.toString()}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2BB799),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SingleChildScrollView(
                        child: Text(
                          widget.question.name,
                          // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis purus, blandit ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.2,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 150),
              //   height: 100,
              //   width: 100,
              //   decoration: const BoxDecoration(
              //     shape: BoxShape.circle,
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [Color(0xff22987F), Color(0xff2BB799)],
              //     ),
              //   ),
              //   child: Center(
              //     child: Text(
              //      // _start.toString(),
              //      '',
              //       style: TextStyle(
              //         fontSize: 32,
              //         fontWeight: FontWeight.w700,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class Answer extends StatelessWidget {
  Answer({required this.answer, required this.color});
  var answer;
  var color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: color, //Colors.black.withOpacity(.24),
          width: 2,
        ),
      ),
      child: Text(
        // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis purus, blandit ?",
        answer.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          height: 1.7,
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
