import 'dart:developer';
import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeItemImageWithIcon extends StatelessWidget {
  const RecipeItemImageWithIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(Assets.imagesPancakeTest))),
          ),
          Positioned(
            top: 16,
            right: context.locale == Constants.arabicLocale ? null : 16,
            left: context.locale == Constants.arabicLocale ? 16 : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child:
                      Center(child: SvgPicture.asset(Assets.imagesHeartIcon)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
