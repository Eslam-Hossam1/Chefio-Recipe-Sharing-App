import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AdaptivePadding extends StatelessWidget {
  const AdaptivePadding({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPadding(context)),
      child: child,
    );
  }

  double getPadding(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < SizeConfig.tabletBreakPoint) {
      return Constants.kMobileHorizontalPadding;
    } else {
      return Constants.kTabletHorizontalpadding;
    }
  }
}
