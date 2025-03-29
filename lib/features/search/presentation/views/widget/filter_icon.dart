
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      SvgPicture.asset(
        Assets.imagesFilter,
        colorFilter: ColorFilter.mode(
          context.mainTextColor,
          BlendMode.srcIn,
        ),
      ),
      Positioned(
          top: -1,
          right: -1,
          child: CircleAvatar(
            radius: 5,
            backgroundColor: context.scaffoldBackgroundColor,
            child: CircleAvatar(
              radius: 4,
              backgroundColor: context.primaryColor,
            ),
          )),
    ]);
  }
}
