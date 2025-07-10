import 'dart:io';

import 'package:chefio_app/core/utils/theme/app_colors.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/upload/presentation/manager/step_item_cubit/step_item_cubit.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_form_cubit/upload_form_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/step_image_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StepImageDialog extends StatelessWidget {
  const StepImageDialog({
    super.key,
    required this.parentContext,
    required this.stepImageIndex,
    required this.imageViewer,
  });

  final Widget imageViewer;
  final BuildContext parentContext;
  final int stepImageIndex;

  @override
  Widget build(BuildContext context) {
    final stepItemCubit = parentContext.read<StepItemCubit>();

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
                    stepImageIndex: stepImageIndex,
                    icon: Icons.edit,
                    text: 'Edit',
                    onTap: () {
                      context.pop(true);
                    },
                  ),
                  StepImageDialogButton(
                    stepImageIndex: stepImageIndex,
                    icon: Icons.delete,
                    color: AppColors.logoutIcon,
                    text: 'Remove',
                    onTap: () {
                      parentContext.read<UploadFormCubit>().removeStepImage(
                            index: stepImageIndex,
                          );
                      parentContext.read<StepItemCubit>().removeImage();
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
