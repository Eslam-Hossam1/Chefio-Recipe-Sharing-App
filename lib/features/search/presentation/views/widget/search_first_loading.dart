import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_skeletonizer_recipes_grid.dart';
import 'package:flutter/material.dart';

class SearchFirstLoading extends StatelessWidget {
  const SearchFirstLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAdaptivePadding(sliver: SliverSkeletonizerRecipesGrid());
  }
}
