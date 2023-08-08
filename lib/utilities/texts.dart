import 'package:flutter/material.dart';

class TextHelper {

  //BOLD
  final xxlb = const TextStyle(
      fontSize: 33, fontWeight: FontWeight.w900, color: Color(0xff000000));    

  final h1b = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xff000000)); 

  late var h2b = h1b.copyWith(fontSize: 18);

  late var h3b = h1b.copyWith(fontSize: 16);

  late var h4b = h1b.copyWith(fontSize: 14);

  late var bodyTextb = h1b.copyWith(fontSize: 12);

  //REGULAR
final xxlr = const TextStyle(
      fontSize: 35, fontWeight: FontWeight.w500, color: Color(0xff000000));    

  final h1r = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff000000));

  late var h2r = h1r.copyWith(fontSize: 18);

  late var h3r = h1r.copyWith(fontSize: 16);

  late var h4r = h1r.copyWith(fontSize: 14);

  late var bodyTextr = h1r.copyWith(fontSize: 12);

  //LIGHT

  final xxll = const TextStyle(
      fontSize: 35, fontWeight: FontWeight.w300, color: Color(0xff000000));    

  final h1l = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w300, color: Color(0xff000000));

  late var h2l = h1l.copyWith(fontSize: 18);

  late var h3l = h1l.copyWith(fontSize: 16);

  late var h4l = h1l.copyWith(fontSize: 14);

  late var bodyTextl = h1l.copyWith(fontSize: 12);
}
