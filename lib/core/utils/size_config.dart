import 'package:flutter/material.dart';

abstract class SizeConfig {
  static const double tabletBreakPoint = 600;
    static double getPadding(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width > 600 ? width*11 : width*7.3; // Tablet: 40, Mobile: 24
  }

}
