import 'dart:io';

import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFileCircleImage extends StatelessWidget {
  const CustomFileCircleImage({
    super.key,
    required this.baseSize,
    required this.image,
  });

  final double baseSize;
  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(shape: BoxShape.circle),
      height: (baseSize.w).clamp(baseSize, baseSize + (baseSize / 4)),
      width: (baseSize.w).clamp(baseSize, baseSize + (baseSize / 4)),
      child: Image.file(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
