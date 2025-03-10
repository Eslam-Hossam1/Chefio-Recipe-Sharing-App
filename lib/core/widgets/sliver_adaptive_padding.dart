import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class SliverAdaptivePadding extends StatelessWidget {
  const SliverAdaptivePadding({super.key, required this.sliver});
  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: getPadding(context)),
      sliver: sliver,
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
