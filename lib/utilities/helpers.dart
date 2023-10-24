import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';
import 'package:path_provider/path_provider.dart';

AppBar getAppBar(
    {required String title,
    required context,
    bool showBackBtn = true,
    bool setShape = true}) {
  var couleurs = ColorHelper();

  return AppBar(
    leading: showBackBtn ? BackButton() : null,
    backgroundColor: Color(0xff22987f),
    elevation: 0.1,
    flexibleSpace: Stack(
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
    title: Text(title),
    centerTitle: true,
    shape: setShape
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          )
        : null,
  );
}

FloatingActionButton fab({Function()? onPressed}) {
  return FloatingActionButton(
    onPressed: onPressed,
    backgroundColor: Color(0xff22987f),
    child: Icon(Icons.add),
  );
}

BoxDecoration getBckDecoration() {
  var colors = ColorHelper();
  return BoxDecoration(
    color: colors.white.withOpacity(0.5),
    image: DecorationImage(
        image: AssetImage("assets/images/math.png"),
        opacity: 0.04,
        fit: BoxFit.cover),
  );
}

PageDecoration getPageDec() {
  return PageDecoration(
    safeArea: 0,
    imagePadding: EdgeInsets.only(bottom: 0),
    footerPadding: EdgeInsets.all(0),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  );
}

getInputDecoration({String? hintText}) {
  return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      hintText: (hintText ?? "").tr,
      counterText: '',
      hintStyle: TextHelper().h4l.copyWith(
          color: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? ColorHelper().green
                  : ColorHelper().grey)),
      // prefixIcon: prefixIcon,
      prefixIconColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.focused)
              ? ColorHelper().green
              : ColorHelper().grey),
      focusColor: ColorHelper().green,
      hoverColor: ColorHelper().green,
      fillColor: ColorHelper().green,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorHelper().grey, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorHelper().red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorHelper().green,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))));
}

Future<void> downloadFile(String url) async {
  HttpClient httpClient = new HttpClient();
  File file;
  String fileName;
  String filePath = '';

  try {
    fileName = url.split("/").last;
    EasyLoading.show();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var path = await _getDownloadPath();
    if (response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      filePath = '$path/$fileName';
      file = File(filePath);
      await file.writeAsBytes(bytes);
      EasyLoading.showSuccess(
          "Votre fichier a bien été téléchargé dans le repertoire $filePath",
          duration: Duration(seconds: 5));
    } else {
      EasyLoading.showError(
          "'Error code: ' + ${response.statusCode.toString()}");
    }
  } catch (err) {
    print(err);
    EasyLoading.showError("Cannot fetch url");
  }
}

Future<String?> _getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists())
        directory = await getExternalStorageDirectory();
    }
  } catch (err) {
    print("Cannot get download folder path");
  }
  return directory?.path;
}
