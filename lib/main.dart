import 'dart:math';
import 'test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/controllers/home_controller.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/colors.dart';
import 'screens/splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myskul/translations/translation.dart';

bool? seen;
String? token;
String? locale;
late User user;
void main() async {
  // HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Future<SharedPreferences> _prefs2 = SharedPreferences.getInstance();

  final SharedPreferences prefs = await _prefs;
  final SharedPreferences prefs2 = await _prefs2;
  seen = await prefs2.getBool('first');
  token = await prefs.getString('token');
  locale = await prefs.getString('locale');
  if (token != null) {
    user = await HomeController().currentUser(token);
  }

  if (locale != null) {
    Get.updateLocale(Locale(locale!));
  }
  runApp(Home1());
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

class Home1 extends StatefulWidget {
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
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

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Future<SharedPreferences> _prefs2 = SharedPreferences.getInstance();

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
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      // supportedLocales: L10n.all,
      translations: Messages(),
      locale: Get.locale,
      fallbackLocale: Locale('fr', 'FR'),
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Scaffold(
        body: seen == null || seen == false
            ? Splash()
            : token == null
                ? Login()
                : Home(user: user),
      ),
    );
  }
}
