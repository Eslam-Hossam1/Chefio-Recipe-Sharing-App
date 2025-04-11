import 'package:chefio_app/features/home/presentation/manager/home_recipes_cubit/home_recipes_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_scrolling_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScrollingLoadingIndicatorbuilder extends StatelessWidget {
  const HomeScrollingLoadingIndicatorbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeRecipesCubit, HomeRecipesState>(
      builder: (context, state) {
        return state is HomeRecipesLoadingMore
            ? SliverScrollingLoadingIndIcator()
            : SliverToBoxAdapter(
                child: SizedBox(),
              );
      },
    );
  }
}
