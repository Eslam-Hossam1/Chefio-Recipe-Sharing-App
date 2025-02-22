import 'package:chefio_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DishImage extends StatelessWidget {
  final String assetPath;

  const DishImage({super.key, required this.assetPath, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: getDishResponsiveSize(context,
          baseWidth: size), // Make size responsive
      height: getDishResponsiveSize(context,
          baseWidth: size), // Make size responsive
    );
  }

  double getDishResponsiveSize(BuildContext context,
      {required double baseWidth}) {
    double upperLimit = baseWidth * 3;
    double lowerLimit = baseWidth * 0.75;
    double dishResponsiveSize =
        baseWidth * (MediaQuery.sizeOf(context).width / Constants.kDesignWidth);
    return (dishResponsiveSize + 15).clamp(lowerLimit, upperLimit);
  }
}
