import 'package:flutter/material.dart';

class GradientHelper {
  late var greenGradient = const LinearGradient(
    colors: [Color(0xff067d6d), Color(0xff269d82)],
    stops: [0.25, 0.75],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
