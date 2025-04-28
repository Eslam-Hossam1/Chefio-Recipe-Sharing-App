import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_skeletonizer_recipes_grid.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_app_bar.dart';
import 'package:flutter/material.dart';

class SearchViewBodyFirstLoading extends StatelessWidget {
  const SearchViewBodyFirstLoading({super.key});

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
        SliverAdaptivePadding(sliver: SliverSkeletonizerRecipesGrid()),
      ],
    );
  }
}
