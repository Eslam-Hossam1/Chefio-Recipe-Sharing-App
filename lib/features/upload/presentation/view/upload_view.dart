import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_error_message.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/upload_success_dialog.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/upload_second_step_page.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/upload_first_step_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key, this.recipeDetailModel});
  final RecipeDetailsModel? recipeDetailModel;
  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      setState(() => _currentPage++);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      setState(() => _currentPage--);
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<UploadRecipeCubit>().checkAndInitForEditing(
          recipeDetailModel: widget.recipeDetailModel,
        );
    context.read<UploadRecipeCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocConsumer<UploadRecipeCubit, UploadRecipeState>(
        listener: (context, state) {
          if (state is UploadRecipeFailed) {
            DialogHelper.showErrorDialog(
              context,
              errorMessage: state.errorLocalizationKey.tr(),
            );
          } else if (state is UploadRecipeSuccess) {
            showDialog(
              context: context,
              builder: (context) {
                return SetRecipeSuccessDialog();
              },
            );
          }
        },
        builder: (context, state) {
          if (state is CategoriesFailed) {
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child:
                  CustomTextErrorMessage(text: state.errorLocalizationKey.tr()),
            );
          } else if (state is LoadingCategories) {
            return Center(
              child: CustomCircularProgressIndicator(),
            );
          } else {
            return PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                UploadFirstStepPage(
                  onNext: _nextPage,
                  recipeDetailModel: widget.recipeDetailModel,
                ),
                UploadSecondStepPage(onBack: _previousPage),
              ],
            );
          }
        },
      ),
    ));
  }
}
