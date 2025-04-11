import 'dart:ui';

import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/core/cubit/recipe_like_cubit/recipe_like_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/Glass_favourite_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    required this.recipeModel,
  });
  final Recipe recipeModel;
  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  late bool isFavourte;
  @override
  void initState() {
    isFavourte = widget.recipeModel.likes is int;
    super.initState();
  }

  void toggle() {
    setState(() {
      isFavourte = !isFavourte;
      context
          .read<RecipeLikeCubit>()
          .likeRecipe(recipeId: widget.recipeModel.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeLikeCubit, RecipeLikeState>(
      listener: (context, state) {
        if (state is RecipeLikeFailed) {
          showCustomToast(context,
              message: state.errorLocalizationKey.tr(), seconds: 2);
        }
      },
      builder: (context, state) {
        if (state is RecipeLikeFailed &&
            state.recipeId == widget.recipeModel.id) {
          isFavourte = !isFavourte;
        }
        return GestureDetector(
          onTap: () {
            toggle();
          },
          child: GlassFavouriteIcon(
            isFavourte: isFavourte,
          ),
        );
      },
    );
  }
}
