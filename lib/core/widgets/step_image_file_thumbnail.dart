
import 'dart:io';

import 'package:flutter/material.dart';

class StepImageFileThumbnail extends StatelessWidget {
  const StepImageFileThumbnail({
    super.key,
    required this.fileImage,
  });

  final File fileImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 271 / 155,
        child: Image.file(
          fit: BoxFit.cover,
          fileImage,
        ),
      ),
    );
  }
}
