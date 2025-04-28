import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/custom_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CookingDurationSection extends StatelessWidget {
  const CookingDurationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${AppLocalizationKeys.upload.cookingDuration.tr()} ',
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              Text(
                AppLocalizationKeys.upload.inMinutes.tr(),
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Customslider(
            initialCurrentValue:
                context.read<UploadRecipeCubit>().foodCookDuration,
          ),
        ],
      ),
    );
  }
}
