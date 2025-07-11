
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditView extends StatefulWidget {
  const EditView({super.key,required  this.recipeDetailModel});
  final RecipeDetailsModel recipeDetailModel;
  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
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
    context.read<UploadFormCubit>().checkAndInitForEditing(
          recipeDetailModel: widget.recipeDetailModel,
        );
    context.read<UploadFormCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<UploadFormCubit, UploadFormState>(
        builder: (context, state) {
          if (state is CategoriesFailed) {
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: CustomInfoMessageWithButton(
                message: state.errorLocalizationKey.tr(),
                onPressed: context.read<UploadFormCubit>().fetchCategories,
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
