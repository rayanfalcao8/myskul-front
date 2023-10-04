import 'package:flutter/material.dart';
import 'package:myskul/screens/fitness/workout_page.dart';
import 'package:myskul/utilities/helpers.dart';

class Fitness extends StatelessWidget {
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
                bodyPart: "ABDOS",
                bckImg: "assets/images/workout/abs_begin.jpg"),
            _buildCard(context, bodyPart: "POITRINE", bckImg: "bckImg"),
            _buildCard(context, bodyPart: "BRAS", bckImg: "bckImg"),
            _buildCard(context, bodyPart: "JAMBES", bckImg: "bckImg"),
            _buildCard(context, bodyPart: "Epaules", bckImg: "bckImg"),
            SizedBox(height: 20),
            Text("Intermédiaire".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildCard(context, bodyPart: "ABDOS", bckImg: "bckImg", level: 2),
            _buildCard(context,
                bodyPart: "POITRINE", bckImg: "bckImg", level: 2),
            _buildCard(context, bodyPart: "BRAS", bckImg: "bckImg", level: 2),
            _buildCard(context, bodyPart: "JAMBES", bckImg: "bckImg", level: 2),
            _buildCard(context,
                bodyPart: "Epaules", bckImg: "bckImg", level: 2),
            SizedBox(height: 20),
            Text("Avancé".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildCard(context, bodyPart: "ABDOS", bckImg: "bckImg", level: 3),
            _buildCard(context,
                bodyPart: "POITRINE", bckImg: "bckImg", level: 3),
            _buildCard(context, bodyPart: "BRAS", bckImg: "bckImg", level: 3),
            _buildCard(context, bodyPart: "JAMBES", bckImg: "bckImg", level: 3),
            _buildCard(context,
                bodyPart: "Epaules", bckImg: "bckImg", level: 3),
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
