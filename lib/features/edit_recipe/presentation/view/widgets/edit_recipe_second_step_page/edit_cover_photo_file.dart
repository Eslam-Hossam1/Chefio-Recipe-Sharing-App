import 'dart:io';

import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_cover_photo_cubit.dart/edit_recipe_cover_photo_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/cover_photo_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRecipeCoverFile extends StatelessWidget {
  const EditRecipeCoverFile({
    super.key,
    required this.recipeImageFile,
  });
  final File recipeImageFile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final parentContext = context;
        bool? pickImage;
        pickImage = await showCoverPhotoDialog(pickImage, parentContext);
        if (pickImage != null && pickImage) {
          if (context.mounted) {
            showChooseImageMethodBottomSheet(context);
          }
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          recipeImageFile,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Future<bool?> showCoverPhotoDialog(
      bool? pickImage, BuildContext parentContext) async {
    pickImage = await showDialog(
      context: parentContext,
      builder: (context) {
        return CoverPhotoDialog(
          removeImageMethod: () {
            parentContext
                .read<EditRecipeFormCubit>()
                .editRecipeFormModel
                .foodFileImage = null;
            parentContext.read<EditRecipeCoverPhotoCubit>().removeImageFile();
          },
          imageViewer: Image.file(
            recipeImageFile,
          ),
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
          pickImageMethod:
              parentContext.read<EditRecipeCoverPhotoCubit>().pickRecipeImage,
        );
      },
    );
  }
}
