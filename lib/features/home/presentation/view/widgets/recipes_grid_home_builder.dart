import 'dart:developer';

import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/data/models/recipe_model/recipe_model.dart';
import 'package:chefio_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_error_message.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_recipes_grid.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_skeletonizer_recipes_grid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesGridHomeBuilder extends StatelessWidget {
  const RecipesGridHomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoadingMoreFailure) {
          showCustomToast(
            context,
            message: state.errorLocalizationKey.tr(),
          );
        }
      },
      builder: (context, state) {
        if (state is HomeFirstApiFetchFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomTextErrorMessage(text: state.errorLocalizationKey.tr(),),
          );
        } else if (state is HomefirstLoading) {
          return SliverSkeletonizerRecipesGrid();
        } else {
          return SliverRecipesGrid(recipes: context.read<HomeCubit>().recipes);
        }
      },
    );
  }
}
