import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';

AppBar getAppBar(
    {required String title, required context, bool showBackBtn = true}) {
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
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
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
