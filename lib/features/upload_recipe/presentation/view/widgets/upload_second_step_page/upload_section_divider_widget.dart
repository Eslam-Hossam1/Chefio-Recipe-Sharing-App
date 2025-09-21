import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class UploadSectionDivider extends StatelessWidget {
  const UploadSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(
        height: 48,
        thickness: 8,
        color: context.formColor,
      ),
    );
  }
}
