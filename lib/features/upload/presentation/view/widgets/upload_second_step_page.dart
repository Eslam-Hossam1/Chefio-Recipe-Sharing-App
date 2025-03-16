import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_ingredient_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_step_photo_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/enter_ingredient_item.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/enter_step_item.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/sliver_uplaod_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UploadSecondStepPage extends StatelessWidget {
  const UploadSecondStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      top: 12,
      child: CustomScrollView(
        slivers: [
          SliverUploadHeader(
            currentStep: '2',
            steps: '2',
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 47.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizationKeys.global.ingredients.tr(),
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 36.h,
            ),
          ),
          SliverToBoxAdapter(
            child: EnterIngredientItem(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 36.h,
            ),
          ),
          SliverToBoxAdapter(
            child: AddIngredintButton(),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: 48,
              thickness: 8,
              color: context.formColor,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizationKeys.global.steps.tr(),
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          SliverToBoxAdapter(
            child: EnterStepItem(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 8.h,
            ),
          ),
          SliverToBoxAdapter(
            child: AddStepPhotoButton(),
          ),
        ],
      ),
    );
  }
}
