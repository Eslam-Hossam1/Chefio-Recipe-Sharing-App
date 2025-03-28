import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_bold_17_title.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_custom_divider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDescription extends StatelessWidget {
  const RecipeDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeDetailsCustomDivider(),
        CustomBold17Title(
          text: AppLocalizationKeys.upload.description.tr(),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          context.read<RecipeDetailsCubit>().recipeDetailModel!.foodDescription,
          style: Styles.textStyleMedium15(context).copyWith(
            color: context.secondaryTextColor,
          ),
        ),
        RecipeDetailsCustomDivider(),
      ],
    );
  }
}
