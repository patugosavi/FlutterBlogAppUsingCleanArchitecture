import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class MyColors {
  MyColors._();

  static Color primaryColor = FlavorConfig.instance.variables['primaryColor'];
  static const Color secondaryColor = Colors.green;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color transparentColor = Colors.transparent;
  static const Color greenColor = Colors.green;
  static const Color redColor = Colors.red;
}
