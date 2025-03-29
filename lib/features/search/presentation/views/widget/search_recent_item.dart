import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchRecentItem extends StatelessWidget {
  const SearchRecentItem({
    super.key,
    required this.titleText,
  });
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        Assets.imagesTimeCircle,
        colorFilter: ColorFilter.mode(
          context.secondaryTextColor,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        titleText,
        style: Styles.textStyleMedium17(context).copyWith(
          color: context.mainTextColor,
        ),
      ),
      trailing: SvgPicture.asset(
        Assets.imagesArrowUpward,
        colorFilter: ColorFilter.mode(
          context.secondaryTextColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
