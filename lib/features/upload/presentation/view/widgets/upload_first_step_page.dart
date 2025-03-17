import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_cover_photo.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/cooking_duration_section.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/food_name_and_description_section.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/next_button.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/sliver_uplaod_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadFirstStepPage extends StatefulWidget {
  const UploadFirstStepPage({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<UploadFirstStepPage> createState() => _UploadFirstStepPageState();
}

class _UploadFirstStepPageState extends State<UploadFirstStepPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AdaptivePadding(
      top: 12,
      child: CustomScrollView(
        slivers: [
          SliverUploadHeader(
            currentStep: '1',
            steps: '2',
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32.h,
            ),
          ),
          SliverToBoxAdapter(
            child: AddCoverPhoto(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          FoodNameAndDescriptionSection(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.h,
            ),
          ),
          CookingDurationSection(),
          SliverFillRemaining(
            hasScrollBody: false,
            child: NextButton(
              onNext: widget.onNext,
            ),
          ),
        ],
      ),
    );
  }
}
