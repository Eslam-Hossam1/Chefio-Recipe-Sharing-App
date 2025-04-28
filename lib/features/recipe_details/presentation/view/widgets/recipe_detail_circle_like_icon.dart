import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeDetailsCircleLikeIcon extends StatelessWidget {
  const RecipeDetailsCircleLikeIcon({
    super.key,
    required this.isLiked,
  });

  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: (Constants.userTileImageSize / 2).w,
      backgroundColor: isLiked ? context.primaryColor : context.outlineColor,
      child: Center(
          child: SvgPicture.asset(
        Assets.imagesLikesHeart,
        width: (Constants.userTileImageSize / 2).w,
      )),
    );
  }
}
