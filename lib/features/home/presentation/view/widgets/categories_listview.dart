import 'dart:developer';

import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/category_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView(
      {super.key,
      required this.categories,
      required this.onCategoryPressed,
      this.applyPadding = true});
  final List<Category> categories;
  final Function(String categoryName) onCategoryPressed;
  final bool applyPadding;
  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  late int selectedCategoryIndex;
  @override
  void initState() {
    super.initState();
    selectedCategoryIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        padding: widget.applyPadding == true
            ? EdgeInsetsDirectional.only(
                start: width < SizeConfig.tabletBreakPoint
                    ? Constants.kMobileHorizontalPadding
                    : Constants.kTabletHorizontalpadding)
            : null,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
                end: width < SizeConfig.tabletBreakPoint ? 16 : 24),
            child: CategoryButton(
              isSelected: selectedCategoryIndex == index,
              categoryName:
                  widget.categories[index].categoryLocalizationKey?.tr() ??
                      widget.categories[index].name,
              // onPressed: () {
              //   context.read<HomeCubit>().fetchRecipesWithChangeCategory(
              //       categorytype: categories[index].categoryType);
              // },
              onPressed: () {
                if (index == selectedCategoryIndex) return;
                log('click');
                setState(() {
                  selectedCategoryIndex = index;
                });
                widget.onCategoryPressed(widget.categories[index].name);
              },
            ),
          );
        },
      ),
    );
  }
}
