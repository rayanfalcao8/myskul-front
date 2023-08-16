import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/colors.dart';
import 'screens/splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(Home1());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = ColorHelper().green
      ..backgroundColor = Colors.white
      ..indicatorColor = ColorHelper().green
      ..textColor = ColorHelper().green
      ..maskColor = Color.fromARGB(255, 24, 25, 26).withOpacity(0.1)
      ..userInteractions = false
      ..dismissOnTap = false;
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}
