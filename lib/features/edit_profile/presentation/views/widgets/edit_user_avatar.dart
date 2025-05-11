import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_circle_image.dart';
import 'package:flutter/material.dart';

class EditUserAvatar extends StatelessWidget {
  const EditUserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Stack(
          children: [
            CustomCircleImage(
              baseSize: 150,
              userImageUrl:
                  "https://i.ytimg.com/vi/mEhYtnHQAUw/maxresdefault.jpg",
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: context.mainTextColor,
                child: Icon(
                  Icons.camera_alt,
                  size: 25,
                  color: context.scaffoldBackgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
