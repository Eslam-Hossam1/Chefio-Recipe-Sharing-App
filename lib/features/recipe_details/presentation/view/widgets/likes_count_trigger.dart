import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo_impl.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_likers_cubit/recipe_likers_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_likers_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikesCountTrigger extends StatelessWidget {
  const LikesCountTrigger({
    super.key,
    required this.likes,
    required this.recipeId,
  });

  final int likes;
  final String recipeId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (context) {
              return BlocProvider(
                create: (context) => RecipeLikersCubit(
                  getIt<RecipeDetailsRepoImpl>(),
                ),
                child: RecipeLikersBottomSheet(
                  recipeId: recipeId,
                ),
              );
            });
      },
      child: Row(
        children: [
          Text(
            '$likes ',
            style: Styles.textStyleBold17(context)
                .copyWith(color: context.mainTextColor),
          ),
          Text(
            AppLocalizationKeys.global.likes.tr(),
            style: Styles.textStyleBold17(context)
                .copyWith(color: context.mainTextColor),
          ),
        ],
      ),
    );
  }
}
