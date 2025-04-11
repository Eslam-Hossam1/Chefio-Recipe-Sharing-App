import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/features/home/presentation/manager/cubit/home_recipes_cubit.dart';
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
    return BlocConsumer<HomeRecipesCubit, HomeRecipesState>(
      listener: (context, state) {
        if (state is HomeRecipesLoadingMoreFailure) {
          showCustomToast(
            context,
            message: state.errorLocalizationKey.tr(),
          );
        }
      },
      builder: (context, state) {
        if (state is HomeRecipesFirstFetchFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomTextErrorMessage(
              text: state.errorLocalizationKey.tr(),
            ),
          );
        } else if (state is HomeRecipesFirstLoading) {
          return SliverSkeletonizerRecipesGrid();
        } else {
          return SliverRecipesGrid(
              recipes: context.read<HomeRecipesCubit>().recipes);
        }
      },
    );
  }
}
