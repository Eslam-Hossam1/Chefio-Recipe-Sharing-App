import 'package:cached_network_image/cached_network_image.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    this.placeHolder,
  });

  final String url;
  final Widget? placeHolder;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) =>
          placeHolder ??
          Container(
            color: context.cachedNetworkImagePlaceholderColor,
          ),
      errorWidget: (context, url, error) => Center(
        child: Image.asset(
          Assets.imagesImagePlaceholder,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
