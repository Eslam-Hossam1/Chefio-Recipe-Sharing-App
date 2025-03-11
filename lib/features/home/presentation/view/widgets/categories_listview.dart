import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/features/home/data/enums/category_type_enum.dart';
import 'package:chefio_app/features/home/data/models/category_model.dart';
import 'package:chefio_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  List<CategoryModel> categories = [
    CategoryModel.fromCategoryType(categoryType: CategoryType.all),
    CategoryModel.fromCategoryType(categoryType: CategoryType.food),
    CategoryModel.fromCategoryType(categoryType: CategoryType.drink),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
      CategoryType  selectedCategoryType = context.read<HomeCubit>().categoryType;
        return SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: EdgeInsetsDirectional.only(
                start: width < SizeConfig.tabletBreakPoint
                    ? Constants.kMobileHorizontalPadding
                    : Constants.kTabletHorizontalpadding),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(
                    end: width < SizeConfig.tabletBreakPoint ? 16 : 24),
                child: CategoryButton(
                  isSelected:
                      selectedCategoryType == categories[index].categoryType,
                  applocalizationKey: categories[index].applocalizationKey,
                  onPressed: () {
                    context.read<HomeCubit>().fetchRecipesWithCategory(categorytype: categories[index].categoryType);
                    
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
