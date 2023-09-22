import 'package:flutter/material.dart';
import 'package:myskul/components/messages_tiles.dart';
import 'package:myskul/controllers/quiz_controller.dart';
import 'package:myskul/models/quiz.dart';
import 'package:myskul/screens/home.dart';
import '../../utilities/colors.dart';
import '../../utilities/texts.dart';
import 'package:get/get.dart';
import '../../utilities/gradients.dart';
import '../../utilities/icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class Quiz5 extends StatefulWidget {
  Quiz5({required this.questionsLength, required this.quiz});

  var questionsLength;
  QuizModel quiz;

  @override
  State<Quiz5> createState() => _Quiz5State();
}

class _Quiz5State extends State<Quiz5> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final player = AudioPlayer();

  var correctAnswers;

  getCorrectAnswers() async {
    final SharedPreferences prefs = await _prefs;
    var correctAnswers = await prefs.getInt('currentScore')!;

    if (correctAnswers < (widget.questionsLength * 50 / 100)) {
      playLocalAudio("wrong-final");
    } else {
      playLocalAudio("right-final");
    }
    QuizController().answerQuiz(score: correctAnswers, quiz: widget.quiz);
    return correctAnswers;
  }

  playLocalAudio(String music) async {
    await player.play(AssetSource('sons/$music.mp3'));
  }

  String getAppreciation(var score, var length) {
    if (score <= (length * 20 / 100)) {
      return "null".tr;
    } else if (score <= (length * 40 / 100)) {
      return "insuffisant".tr;
    } else if (score <= (length * 49 / 100)) {
      return "mediocre".tr;
    } else if (score == (length * 50 / 100)) {
      return "passable".tr;
    } else if (score <= (length * 70 / 100)) {
      return "assez-bien".tr;
    } else if (score <= (length * 80 / 100)) {
      return "bien".tr;
    } else if (score <= (length * 90 / 100)) {
      return "tres-bien".tr;
    } else {
      return "excellent".tr;
    }
  }

  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  @override
  void initState() {
    // TODO: implement initState
    correctAnswers = getCorrectAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: couleurs.white.withOpacity(0.5),
          image: DecorationImage(
              image: AssetImage("assets/images/math.png"),
              opacity: 0.04,
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).size.height / 12,
                decoration: BoxDecoration(
                    gradient: gradients.greenGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Stack(
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
                    Column(
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
                                    Get.to(() => Home());
                                  },
                                  child: Icon(
                                    icones.back2,
                                    color: couleurs.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Center(
                                child: Text(
                                  widget.quiz.name,
                                  style: textes.h4l
                                      .copyWith(color: couleurs.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: correctAnswers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return NotFoundWidget(texte: 'Not Found');
                  } else {
                    return Container(
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                      ),
                                      ListTile(
                                        title: Text(
                                          "c-answer".tr,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                        trailing: Text(
                                          snapshot.data.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          "w-answer".tr,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                        trailing: Text(
                                          (widget.questionsLength -
                                                  snapshot.data)
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          "f-score".tr,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                        trailing: Text(
                                          "${snapshot.data}/${widget.questionsLength}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xFF22987F),
                                          ),
                                        ),
                                      ),
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
                                      colors: [
                                        Color(0xff22987F),
                                        Color(0xff2BB799)
                                      ],
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
                              height: 38,
                            ),
                            AnimatedOpacity(
                              opacity: 1.0,
                              duration: const Duration(seconds: 2),
                              child: Text(
                                getAppreciation(
                                    snapshot.data, widget.questionsLength),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF22987F),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: couleurs.green,
                  ),
                ); // Display the fetched data
              },
            ),
          ],
        ),
      ),
    );
  }
}
