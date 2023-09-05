import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/screens/quiz/questions.dart';

import '../../utilities/colors.dart';
import '../../utilities/texts.dart';

class QuizDetail extends StatelessWidget {
  QuizDetail({required this.quiz});
  var quiz;
  var couleurs = ColorHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: BackButton(),
            backgroundColor: Color(0xff22987f),
            expandedHeight: 80,
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 30.0),
                child: Text(
                  quiz.name,style: TextHelper().bodyTextr.copyWith(color: ColorHelper().white)
                ),
              ),
              background: Stack(
                children: [
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 150),
                        width: MediaQuery.of(context).size.width,
                        height: 240,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: Color.fromARGB(0, 0, 0, 0), width: 2.0),
                          border: Border.all(
                            color: const Color(0xFF2BB799),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            ListTile(
                              title: Text(
                                "NOMBRE DE QUESTIONS",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              trailing: Text(
                                quiz.nb_questions.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                quiz.done ? "SCORE PRECEDENT" : "JAMAIS ESSAYÉ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              trailing: Text(
                                quiz.done ? quiz.score.toString() : "",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                          //   ListTile(
                          //     title: Text(
                          //       "DUREE DU QUIZ",
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //         fontWeight: FontWeight.w200,
                          //       ),
                          //     ),
                          //     trailing: Text(
                          //       "90 sec",
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //         fontWeight: FontWeight.w200,
                          //       ),
                          //     ),
                          //   ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 90),
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
                        child: const Center(
                          child: Icon(
                            Icons.event_note_outlined,
                            color: Colors.white,
                            size: 58,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                         Get.to(() => Questions());
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Text(
                              "COMMENCER",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF22987F),
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF22987F)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
