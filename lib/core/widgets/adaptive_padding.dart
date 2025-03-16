import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AdaptivePadding extends StatelessWidget {
  const AdaptivePadding({super.key, required this.child, this.top});
  final Widget child;
  final double? top;
  @override
  Widget build(BuildContext context) {
    final horizontalPadding = getPadding(context);
    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        top: top ?? 0,
      ),
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
