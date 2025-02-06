import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

double getAuthHorizontalPadding(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tabletBreakPoint) {
    return Constants.kMobileHorizontalPadding;
  } else {
    return width * .15;
  }
}
