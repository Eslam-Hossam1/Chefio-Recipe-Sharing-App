import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_cover_photo_cubit.dart/edit_recipe_cover_photo_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRecipeCoverUrl extends StatelessWidget {
  const EditRecipeCoverUrl({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    var pickImageMethod =
        context.read<EditRecipeCoverPhotoCubit>().pickRecipeImage;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: context.scaffoldBackgroundColor,
          context: context,
          builder: (context) {
            return ChooseImageSourceBottomSheet(
              pickImageMethod:
                  pickImageMethod,
            );
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CustomCachedNetworkImage(url: imageUrl),
      ),
    );
  }
}
