import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsStepItem extends StatelessWidget {
  const RecipeDetailsStepItem(
      {super.key, required this.stepIndex, req, this.url});
  final String? url;
  final int stepIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: context.mainTextColor,
          child: Text(
            '${stepIndex + 1}',
            style: Styles.textStyleBold12(context).copyWith(
              color: context.scaffoldBackgroundColor,
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
                style: Styles.textStyleMedium15(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              url != null
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        // AddStepPhotoButton(selectedImage),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AspectRatio(
                                aspectRatio: 271 / 155,
                                child: Image.asset(
                                    fit: BoxFit.cover,
                                    Assets.imagesPancakeTest))),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
