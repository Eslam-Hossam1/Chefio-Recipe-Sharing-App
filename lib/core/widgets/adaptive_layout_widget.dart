import 'package:chefio_app/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
  });
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < SizeConfig.tabletBreakPoint) {
      return mobileLayout(context);
    } else {
      return tabletLayout(context);
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < SizeConfig.tabletBreakPoint) {
          return mobileLayout(context);
        } else {
          return tabletLayout(context);
        }
      },
    );
  }
}
