
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationRecipeImage extends StatelessWidget {
  const NotificationRecipeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      height: (64.w).clamp(58, 64 + (64 / 4)),
      width: (64.w).clamp(58, 64 + (64 / 4)),
      child: CustomCachedNetworkImage(
        url:
            "https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg",
      ),
    );
  }
}
