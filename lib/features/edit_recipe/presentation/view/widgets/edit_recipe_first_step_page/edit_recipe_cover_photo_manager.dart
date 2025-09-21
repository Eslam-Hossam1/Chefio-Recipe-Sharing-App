import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_cover_photo_cubit.dart/edit_recipe_cover_photo_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_cover_photo_file.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_first_step_page/edit_recipe_cover_url.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_first_step_page/empty_cover_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRecipeCoverPhotoManager extends StatelessWidget {
  const EditRecipeCoverPhotoManager({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: (MediaQuery.sizeOf(context).width * .8).clamp(200, 400),
        child: AspectRatio(
          aspectRatio: 1,
          child: BlocConsumer<EditRecipeCoverPhotoCubit,
              EditRecipeCoverPhotoState>(listener: (context, state) {
            if (state is PickedRecipeImage) {
              context
                  .read<EditRecipeFormCubit>()
                  .editRecipeFormModel
                  .foodFileImage = state.recipeImageFile;
            }
          }, builder: (context, state) {
            if (state is UrlImage) {
              return EditRecipeCoverUrl(
                imageUrl: state.imageUrl,
              );
            } else if (state is PickedRecipeImage) {
              return EditRecipeCoverFile(
                recipeImageFile: state.recipeImageFile,
              );
            } else {
              return EmptyCoverPhoto();
            }
          }),
        ),
      ),
    );
  }
}
