import 'dart:io';

import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/core/widgets/step_image_file_thumbnail.dart';
import 'package:chefio_app/core/widgets/step_image_dialog.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/step_item_cubit/step_item_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepFileImage extends StatelessWidget {
  const StepFileImage(
      {super.key, required this.fileImage, required this.stepImageIndex});
  final File fileImage;
  final int stepImageIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final parentContext = context;
        bool? pickImage;
        pickImage = await showStepImageDialog(pickImage, parentContext);
        if (pickImage != null && pickImage) {
          if (context.mounted) {
            showChooseImageMethodBottomSheet(context);
          }
        }
      },
      child: StepImageFileThumbnail(
        fileImage: fileImage,
      ),
    );
  }

  Future<bool?> showStepImageDialog(
      bool? pickImage, BuildContext parentContext) async {
    pickImage = await showDialog(
      context: parentContext,
      builder: (context) {
        return StepImageDialog(
          stepImageIndex: stepImageIndex,
          imageViewer: Image.file(
            fileImage,
          ),
          removeImageMethod: () {
            parentContext.read<UploadRecipeFormCubit>().removeStepImage(
                  index: stepImageIndex,
                );
            parentContext.read<StepItemCubit>().removeImage();
          },
        );
      },
    );
    return pickImage;
  }

  void showChooseImageMethodBottomSheet(BuildContext parentContext) {
    showModalBottomSheet(
      backgroundColor: parentContext.scaffoldBackgroundColor,
      context: parentContext,
      builder: (context) {
        return ChooseImageSourceBottomSheet(
          pickImageMethod: parentContext.read<StepItemCubit>().pickAndSetImage,
        );
      },
    );
  }
}
