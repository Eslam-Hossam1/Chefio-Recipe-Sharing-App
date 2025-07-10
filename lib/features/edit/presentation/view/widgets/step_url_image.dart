import 'dart:io';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class StepUrlImage extends StatelessWidget {
  const StepUrlImage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CustomCachedNetworkImage(
                  url: url,
                ),
              );
            });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 271 / 155,
          child: CustomCachedNetworkImage(url: url),
        ),
      ),
    );
  }
}
