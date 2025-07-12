import 'package:chefio_app/core/utils/theme/app_colors.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/step_image_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StepImageDialog extends StatelessWidget {
  const StepImageDialog({
    super.key,
    required this.stepImageIndex,
    required this.imageViewer, required this.removeImageMethod,
  });

  final Widget imageViewer;
  final int stepImageIndex;
  final VoidCallback removeImageMethod;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: imageViewer,
            ),
            Container(
              color: context.scaffoldBackgroundColor,
              child: Row(
                children: [
                  StepImageDialogButton(
                    icon: Icons.edit,
                    text: 'Edit',
                    onTap: () {
                      context.pop(true);
                    },
                  ),
                  StepImageDialogButton(
                    icon: Icons.delete,
                    color: AppColors.logoutIcon,
                    text: 'Remove',
                    onTap: () {
                      removeImageMethod();
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
