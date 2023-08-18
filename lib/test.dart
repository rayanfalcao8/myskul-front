import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final Future<SharedPreferences> _prefs2 = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    print(Get.locale);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'my-account'.tr,
                style: TextHelper().h1b,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        Get.updateLocale(Locale("en"));
                        final SharedPreferences prefs = await _prefs2;
                        await prefs.setString('locale', "en");
                      },
                      child: Text("EN")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async{
                        Get.updateLocale(Locale("fr"));
                        final SharedPreferences prefs = await _prefs2;
                        await prefs.setString('locale', "fr");
                      },
                      child: Text("FR")),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
