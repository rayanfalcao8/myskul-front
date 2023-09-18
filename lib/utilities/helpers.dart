import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/texts.dart';

AppBar getAppBar({required String title}) {
  return AppBar(
    leading: BackButton(),
    backgroundColor: Color(0xff22987f),
    title: Text(title),
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
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
