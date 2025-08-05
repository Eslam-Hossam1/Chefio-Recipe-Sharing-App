import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_info_message_with_button.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_first_step_page.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/upload_second_step_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadView extends StatefulWidget {
  const UploadView({
    super.key,
  });
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

    context.read<UploadRecipeFormCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<UploadRecipeFormCubit, UploadRecipeFormState>(
        builder: (context, state) {
          if (state is CategoriesFailed) {
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: CustomInfoMessageWithButton(
                message: state.errorLocalizationKey.tr(),
                onPressed:
                    context.read<UploadRecipeFormCubit>().fetchCategories,
              ),
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
