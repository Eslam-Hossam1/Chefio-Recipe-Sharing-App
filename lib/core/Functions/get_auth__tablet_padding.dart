import 'package:chefio_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

getAuthTabletPadding(context) {
  double width = MediaQuery.sizeOf(context).width;
  return width * .15;
}
