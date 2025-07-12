import 'dart:io';

import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class StepImageUrlThumbnail extends StatelessWidget {
  const StepImageUrlThumbnail({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 271 / 155,
        child: CustomCachedNetworkImage(
          url: url,
        ),
      ),
    );
  }
}
