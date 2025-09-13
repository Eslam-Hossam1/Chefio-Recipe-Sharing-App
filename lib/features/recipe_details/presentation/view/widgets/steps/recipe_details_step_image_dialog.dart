import 'dart:ui';

import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsStepImageDialog extends StatelessWidget {
  const RecipeDetailsStepImageDialog({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Center(
          child: CustomCachedNetworkImage(
            url: url,
          ),
        ),
      ),
    );
  }
}
