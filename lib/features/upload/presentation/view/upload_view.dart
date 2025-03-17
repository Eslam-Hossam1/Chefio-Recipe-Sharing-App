import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/upload/presentation/manager/cubit/add_ingredients_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/upload_first_step_page.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/upload_second_step_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

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
  Widget build(BuildContext context) {
    context.setLocale(Constants.arabicLocale);
    return Scaffold(
        body: SafeArea(
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          UploadFirstStepPage(onNext: _nextPage),
          UploadSecondStepPage(onBack: _previousPage),
        ],
      ),
    ));
  }
}
