import 'package:flutter/material.dart';
import 'package:myskul/utilities/colors.dart';
import 'screens/splash.dart';

void main() {
  runApp(Home1());
}

class Home1 extends StatelessWidget {

  Map<int, Color> color = {
    50: ColorHelper().green,
    100: ColorHelper().green,
    200: ColorHelper().green,
    300: ColorHelper().green,
    400: ColorHelper().green,
    500: ColorHelper().green,
    600: ColorHelper().green,
    700: ColorHelper().green,
    800: ColorHelper().green,
    900: ColorHelper().green,
  };

 

  @override
  Widget build(BuildContext context) {

  MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
  
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}
