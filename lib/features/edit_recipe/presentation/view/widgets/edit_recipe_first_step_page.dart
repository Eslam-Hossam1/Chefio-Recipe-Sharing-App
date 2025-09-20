import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_cooking_duration_section.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_cover_photo_manager.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_food_name_and_description_section.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_next_button.dart';
import 'package:chefio_app/core/widgets/sliver_set_recipe_header.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_choose_category_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditRecipeFirstStepPage extends StatefulWidget {
  const EditRecipeFirstStepPage({
    super.key,
    required this.onNext,
  });
  final VoidCallback onNext;
  @override
  State<EditRecipeFirstStepPage> createState() =>
      _EditRecipeFirstStepPageState();
}

class _EditRecipeFirstStepPageState extends State<EditRecipeFirstStepPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void enableAutoValidation() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: CustomScrollView(
        slivers: [
          SliverAdaptivePadding(
            sliver: SliverSetRecipeHeader(
              currentStep: '1',
              steps: '2',
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32.h,
            ),
          ),
          SliverAdaptivePadding(
            sliver: SliverToBoxAdapter(
              child: EditRecipeCoverPhotoManager(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          SliverAdaptivePadding(
            sliver: EditFoodNameAndDescriptionSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          EditChooseCategorySection(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          SliverAdaptivePadding(
            sliver: EditCookingDurationSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: AdaptivePadding(
              child: EditRecipeNextButton(
                  enableAutoValidation: enableAutoValidation,
                  onNext: widget.onNext,
                  formKey: formKey),
            ),
          ),
        ],
      ),
    );
  }
}
