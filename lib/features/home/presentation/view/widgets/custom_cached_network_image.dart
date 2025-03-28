import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url, this.placeHolder,
  });

  final String url;
  final Widget? placeHolder;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) =>placeHolder?? Container(
        color: Colors.grey[300],
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(
          Icons.wifi_off,
        ),
      ),
    );
  }
}
