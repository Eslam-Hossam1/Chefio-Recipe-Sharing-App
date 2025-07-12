import 'dart:io';

import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/core/widgets/step_image_file_thumbnail.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_step_item_cubit/edit_step_item_cubit.dart';
import 'package:chefio_app/core/widgets/step_image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditStepFileImage extends StatelessWidget {
  const EditStepFileImage(
      {super.key,
      required this.fileImage,
      required this.stepImageIndex,
      required this.pickImageMethodForChanging});
  final File fileImage;
  final int stepImageIndex;
  final Future<void> Function({required ImageSource imageSource})
      pickImageMethodForChanging;

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
          removeImageMethod: () {
            parentContext.read<EditRecipeFormCubit>().removeStepImage(
                  index: stepImageIndex,
                );
            parentContext.read<EditStepItemCubit>().removeImage();
          },
          stepImageIndex: stepImageIndex,
          imageViewer: Image.file(
            fileImage,
          ),
        );
      },
    );
    return pickImage;
  }

  void showChooseImageMethodBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: context.scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return ChooseImageSourceBottomSheet(
          pickImageMethod: pickImageMethodForChanging,
        );
      },
    );
  }
}
