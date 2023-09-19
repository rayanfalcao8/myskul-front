import 'package:flutter/material.dart';
import 'dart:math';

class MyGridView extends StatelessWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 1.0, // Set to 1.0 for a square grid
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        padding: EdgeInsets.all(10.0),
        children: List.generate(50, (index) {
          return Container(
            padding: EdgeInsets.all(20.0),
            color: RandomColorModel().getColor(),
            margin: EdgeInsets.all(1.0),
            child: Center(
              child: GridTile(
                footer: Text(
                  'Item $index',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Icon(
                  Icons.access_alarm,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class RandomColorModel {
  final Random random = Random();
  Color getColor() {
    return Color.fromARGB(
      255, // Set alpha to 255 for full opacity
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyGridView(),
  ));
}
