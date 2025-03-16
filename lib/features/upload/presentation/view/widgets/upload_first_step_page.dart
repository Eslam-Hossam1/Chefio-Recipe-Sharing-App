import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custome_email_text_form_field.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_cover_photo.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/cooking_duration_section.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/food_name_and_description_section.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/next_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/sliver_uplaod_header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UploadFirstStepPage extends StatelessWidget {
  const UploadFirstStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverUploadHeader(
            currentStep: '1',
            steps: '2',
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          SliverToBoxAdapter(
            child: AddCoverPhoto(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          FoodNameAndDescriptionSection(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          CookingDurationSection(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: NextButton(),
          ),
        ],
      ),
    );
  }
}
