import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/core/widgets/sliver_set_recipe_header.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/add_cover_photo.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/cooking_duration_section.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/food_name_and_description_section.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/next_button.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_choose_category_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadFirstStepPage extends StatefulWidget {
  const UploadFirstStepPage({
    super.key,
    required this.onNext,
  });
  final VoidCallback onNext;
  @override
  State<UploadFirstStepPage> createState() => _UploadFirstStepPageState();
}

class _UploadFirstStepPageState extends State<UploadFirstStepPage>
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
              child: AddCoverPhoto(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          SliverAdaptivePadding(
            sliver: FoodNameAndDescriptionSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          UploadChooseCategorySection(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          SliverAdaptivePadding(
            sliver: CookingDurationSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: AdaptivePadding(
              child: NextButton(
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
