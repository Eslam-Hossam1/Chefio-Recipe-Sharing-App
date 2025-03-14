
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: url,
      placeholder: (context, url) => Container(
        color: Colors.grey[700],
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
