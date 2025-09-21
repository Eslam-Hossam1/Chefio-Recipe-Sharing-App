import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_first_step_page/edit_recipe_first_step_page.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/widgets/edit_recipe_second_step_page/edit_recipe_second_step_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditView extends StatefulWidget {
  const EditView({
    super.key,
  });
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
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<EditRecipeFormCubit, EditRecipeFormState>(
          builder: (context, state) {
        return PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            EditRecipeFirstStepPage(
              onNext: _nextPage,
            ),
            EditRecipeSecondStepPage(onBack: _previousPage),
          ],
        );
      }),
    ));
  }
}
