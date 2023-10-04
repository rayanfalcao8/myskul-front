import 'package:flutter/material.dart';
import 'package:myskul/screens/fitness/workout_page.dart';
import 'package:myskul/test.dart';
import 'package:myskul/utilities/helpers.dart';

class Fitness extends StatelessWidget {
  String imgPath = "assets/images/workout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Fitness", context: context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: getBckDecoration(),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text("Débutant".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildCard(context,
                bodyPart: "ABDOS", bckImg: "${imgPath}/abs_begin.png"),
            _buildCard(context,
                bodyPart: "POITRINE", bckImg: "${imgPath}/chest_begin.png"),
            _buildCard(context,
                bodyPart: "BRAS", bckImg: "${imgPath}/arms_interm.png"),
            _buildCard(context,
                bodyPart: "JAMBES", bckImg: "${imgPath}/legs_interm.png"),
            _buildCard(context,
                bodyPart: "Epaules", bckImg: "${imgPath}/shoulders_begin.png"),
            SizedBox(height: 20),
            Text("Intermédiaire".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildCard(context,
                bodyPart: "ABDOS",
                bckImg: "${imgPath}/abs_interm.png",
                level: 2),
            _buildCard(context,
                bodyPart: "POITRINE",
                bckImg: "${imgPath}/chest_advanced.png",
                level: 2),
            _buildCard(context,
                bodyPart: "BRAS",
                bckImg: "${imgPath}/arms_interm.png",
                level: 2),
            _buildCard(context,
                bodyPart: "JAMBES",
                bckImg: "${imgPath}/legs_interm.png",
                level: 2),
            _buildCard(context,
                bodyPart: "Epaules",
                bckImg: "${imgPath}/shoulders_advanced.png",
                level: 2),
            SizedBox(height: 20),
            Text("Avancé".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildCard(context,
                bodyPart: "ABDOS",
                bckImg: "${imgPath}/abs_interm.png",
                level: 3),
            _buildCard(context,
                bodyPart: "POITRINE",
                bckImg: "${imgPath}/chest_advanced.png",
                level: 3),
            _buildCard(context,
                bodyPart: "BRAS",
                bckImg: "${imgPath}/arms_advanced.png",
                level: 3),
            _buildCard(context,
                bodyPart: "JAMBES",
                bckImg: "${imgPath}/legs_interm.png",
                level: 3),
            _buildCard(context,
                bodyPart: "Epaules",
                bckImg: "${imgPath}/chest_advanced.png",
                level: 3),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String bodyPart, required String bckImg, level = 1}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WorkoutPage(level: level, bodyPart: bodyPart)));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Card(
          child: Container(
            height: 150,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(bckImg),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ("${bodyPart} " +
                          (level == 1
                              ? "Débutant"
                              : level > 2
                                  ? "Avancé"
                                  : "Intermédiaire"))
                      .toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                _buildStars(level: level),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildStars({int level = 1}) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: level > 1 ? Colors.yellow : Colors.grey),
        Icon(Icons.star, color: level > 2 ? Colors.yellow : Colors.grey),
      ],
    );
  }
}
