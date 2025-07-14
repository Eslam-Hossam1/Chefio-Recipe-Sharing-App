import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/add_cover_photo_cubit.dart/add_cover_photo_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/empty_cover_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCoverPhoto extends StatelessWidget {
  const AddCoverPhoto({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final addCoverPhotoCubit = context.read<AddCoverPhotoCubit>();

    return Center(
      child: SizedBox(
        width: (MediaQuery.sizeOf(context).width * .8).clamp(200, 400),
        child: AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: context.scaffoldBackgroundColor,
                context: context,
                builder: (context) {
                  return ChooseImageSourceBottomSheet(
                    pickImageMethod: addCoverPhotoCubit.pickRecipeImage,
                  );
                },
              );
            },
            child: BlocConsumer<AddCoverPhotoCubit, AddCoverPhotoState>(
                listener: (context, state) {
              if (state is PickedRecipeImage) {
                context
                    .read<UploadRecipeFormCubit>()
                    .uploadRecipeFormModel
                    .foodImage = state.recipeImageFile;
              }
            }, builder: (context, state) {
              if (state is PickedRecipeImage) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    state.recipeImageFile,
                    fit: BoxFit.contain,
                  ),
                );
              } else {
                return EmptyCoverPhoto();
              }
            }),
          ),
        ),
      ),
    );
  }
}
