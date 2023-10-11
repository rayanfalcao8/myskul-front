import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:myskul/controllers/chat_controller.dart';
import 'package:myskul/controllers/quiz_controller.dart';
import 'package:myskul/introduction_screen.dart';
import 'package:myskul/screens/auth/domain.dart';
import 'package:myskul/screens/auth/reset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/models/user.dart';
import 'package:myskul/screens/auth/login.dart';
import 'package:myskul/screens/chat/chat_group_list.dart';
import 'package:myskul/screens/home.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/constants.dart';
import 'screens/splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myskul/translations/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:uni_links/uni_links.dart';
import 'package:crypto/crypto.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

bool?
    seen; // Cette variable va permettre d'afficher le splash screen une seule fois
String? token; // Token d'authentification de l'utlisateur

String? locale; // Cette variable nous permettra de gérer la langue utilisée
String?
    fmToken; // Cette variable nous permettra d'envoyer des notifications sur chaque appareil
User? user; // Ici sera stocké l'utilisateur principal
bool?
    notif; // Ici sera stocké si oui ou non l'utilisateur veut recevoir les notifications
bool show = true; // Show onBoarding

//fonction pour capture les notification et faire des actions lorsqu'on les reçoit
@pragma("vm:entry-point")
Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final prefs = await _prefs;
  var userString = await prefs.getString('user');
  var userJson = jsonDecode(userString!);
  user = User.fromJson(userJson);
  Get.to(() => GroupChat(user: user!));
}

shMethods(SharedPreferences prefs) async {
  seen = await prefs.getBool('first');
  token = await prefs.getString('token');
  fmToken = await prefs.getString('fmToken');
  locale = await prefs.getString('locale');
  notif = await prefs.getBool('notif');

  if (locale != null) {
    Get.updateLocale(Locale(locale!));
  }
  if (fmToken == null) {
    var tmp = await ChatController().getFmToken();
    await prefs.setString('fmToken', tmp);
    await prefs.setString('fmToken', tmp);
  }

  if (notif == null || notif == false) {
    var tmp = await ChatController()
        .checkUserPushNotification(user!, Constant().TOKEN);
    await prefs.setBool('notif', tmp);
    print("tmp est egal à $tmp");
  }
}

getUser(SharedPreferences prefs) async {
  var userString = await prefs.getString('user');
  if (userString != null) {
    var userJson = jsonDecode(userString);
    user = User.fromJson(userJson);
    return user;
  }
  return null;
}

Future<void> messagingInit() async {
  FirebaseMessaging.onBackgroundMessage(notify);
  await AwesomeNotifications().setListeners(
    onActionReceivedMethod: onActionReceivedMethod,
  );

  FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(alert: true, sound: true);
  FirebaseMessaging.onMessage.listen(
    (m) {
      ChatController().playLocalAudio('bubble.wav');
    },
  );

  AwesomeNotifications().initialize(
    'resource://drawable/res_app_ico',
    [
      NotificationChannel(
        channelKey: 'MySkul',
        channelName: 'MySkul',
        channelDescription: 'MySkul Notification',
        playSound: true,
        importance: NotificationImportance.Max,
        defaultColor: ColorHelper().green,
        ledColor: Colors.white,
        icon: 'resource://drawable/res_app_ico',
      ),
    ],
    debug: true,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(); // Initialisation de firebase

  // Initialisation de firebase messaging et awesome notifications
  await messagingInit();

  // Initialisation du package SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // show = await prefs.getBool("ON_BOARDING") ?? true;

  // lignes de codes afférentes aux SharedPreferences
  await getUser(prefs);
  user != null ? await shMethods(prefs) : null;

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(Home1()),
  );
}

class Home1 extends StatefulWidget {
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  Map<int, Color> color = {
    50: ColorHelper().green.withOpacity(0.5),
    100: ColorHelper().green.withOpacity(0.5),
    200: ColorHelper().green.withOpacity(0.5),
    300: ColorHelper().green.withOpacity(0.5),
    400: ColorHelper().green.withOpacity(0.5),
    500: ColorHelper().green.withOpacity(0.5),
    600: ColorHelper().green.withOpacity(0.5),
    700: ColorHelper().green.withOpacity(0.5),
    800: ColorHelper().green.withOpacity(0.5),
    900: ColorHelper().green.withOpacity(0.5),
  };

  late ConnectivityResult result;
  late StreamSubscription subscription;
  bool isConnected = false;

  showDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: Get.context as BuildContext,
        builder: (context) => CupertinoAlertDialog(
              title: Text('no-internet'.tr),
              content: Text('internet-check'.tr),
              actions: [
                CupertinoButton.filled(
                    child: Text('retry'.tr),
                    onPressed: () {
                      Navigator.pop(context);
                      checkConnection();
                    })
              ],
            ));
  }

  checkConnection() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkConnection();
    });
  }

  StreamSubscription? _sub;

  Future<void> initUniLinks() async {
    // ... check initialLink

    // Attach a listener to the stream
    _sub = linkStream.listen((String? link) {
      // Parse the link and warn the user, if it is not correct
      if (link != null) {
        var uri = Uri.parse(link);
        if (uri.queryParameters['token'] != null &&
            uri.queryParameters['email'] != null) {
          var hashedBytes = uri.queryParameters['token'].toString();
          var digest = sha256
              .convert(utf8.encode(uri.queryParameters['email'].toString()));
          if (digest.toString() == hashedBytes) {
            Get.to(Reset(
                token: uri.queryParameters['token'].toString(),
                email: uri.queryParameters['email'].toString()));
            ;
          } else {
            EasyLoading.showError("Erreur de reinitialisation");
          }
        }
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if (!value) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    startStreaming();
    initUniLinks();
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xff22987F, color);

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
      translations: Messages(),
      locale: Get.locale ?? Get.deviceLocale,
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
                ? (show ? IntroScreen() : Login())
                // ? Login()
                : user!.speciality == null
                    ? Domain()
                    : Home(),
      ),
    );
  }
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

Future notify(RemoteMessage m) async {
  var tmp = m.data;

  AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'MySkul',
        title: tmp['nom'],
        body: tmp['message'],
        summary: tmp['groupe'],
        largeIcon: tmp['image'],
        roundedLargeIcon: true,
        notificationLayout: NotificationLayout.Messaging,
      ),
      actionButtons: [
        NotificationActionButton(
            key: 'key',
            label: Get.locale.toString().contains('en') ? 'ANSWER' : 'REPONDRE')
      ]);
}
