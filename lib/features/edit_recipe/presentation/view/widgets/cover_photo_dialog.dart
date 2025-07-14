import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/theme/app_colors.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/image_dialog_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CoverPhotoDialog extends StatelessWidget {
  const CoverPhotoDialog({
    super.key,
    required this.imageViewer,
    required this.removeImageMethod,
  });

  final Widget imageViewer;
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
                  ImageDialogButton(
                    icon: Icons.edit,
                    text: AppLocalizationKeys.global.edit.tr(),
                    onTap: () {
                      context.pop(true);
                    },
                  ),
                  ImageDialogButton(
                    icon: Icons.undo,
                    color: AppColors.logoutIcon,
                    text: AppLocalizationKeys.global.undo.tr(),
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
