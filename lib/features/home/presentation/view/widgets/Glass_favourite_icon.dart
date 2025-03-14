
import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GlassFavouriteIcon extends StatelessWidget {
  const GlassFavouriteIcon({
    super.key,
    required this.isFavourte,
  });

  final bool isFavourte;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: isFavourte
                ? Icon(
                    Icons.favorite_rounded,
                    color: context.primaryColor,
                  )
                : SvgPicture.asset(
                    Assets.imagesHeartIcon,
                  ),
          ),
        ),
      ),
    );
  }
}
