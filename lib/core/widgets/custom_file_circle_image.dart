import 'dart:io';

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
