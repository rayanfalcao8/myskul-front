import 'package:flutter/material.dart';
import 'colors.dart';

AppBar getAppBar({required String title, required context}) {
  var couleurs = ColorHelper();

  return AppBar(
    leading: BackButton(),
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
