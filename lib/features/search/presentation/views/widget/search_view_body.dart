import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/form_styles.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_field.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_recipes_grid.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_app_bar.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_recent_item.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SearchAppBar(),
        SliverToBoxAdapter(
          child: Divider(
            height: 48,
            thickness: 8,
            color: context.formColor,
          ),
        ),
        
        SliverAdaptivePadding(
            sliver: SliverRecipesGrid(
          recipes: List.generate(
            12,
            (index) => Recipe(
              foodName: '$index',
            ),
          ),
        ),)
      ],
    );
  }
}
