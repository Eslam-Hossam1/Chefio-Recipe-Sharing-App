import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_app_bar_bottom.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_app_bar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDetailsCustomAppBar extends StatelessWidget {
  const RecipeDetailsCustomAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    const double leadingItemHeight = 56;
    const double titleAppearOnCollapseRatio = 0.3;
    const double bottomheight = 48;
    const double bottomFromAppBarDifference = 8;
    double appBarImageInitialHeight = MediaQuery.sizeOf(context).width;
    double appearCollapseHeight = (MediaQuery.sizeOf(context).height * .1)
        .clamp((kToolbarHeight * 1.5), (kToolbarHeight * 3));
    final double realCollapseHeight =
        appearCollapseHeight + bottomheight + bottomFromAppBarDifference;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: appBarImageInitialHeight,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        // Calculate the collapse ratio
        double collapseRatio = (constraints.maxHeight - realCollapseHeight) /
            (appBarImageInitialHeight - realCollapseHeight);
        collapseRatio = collapseRatio.clamp(0.0, 1.0);
        // log('maxHeight: ${constraints.maxHeight} , collapseheight: ${collapseHeight}  , expandedheight: ${appBarImageInitialHeight} , collapseRatio: ${collapseRatio}');

        return Stack(
          fit: StackFit.expand,
          children: [
            // Recipe Image
            CustomCachedNetworkImage(
              placeHolder: Container(
                color: Colors.grey,
              ),
              url: context
                  .read<RecipeDetailsCubit>()
                  .recipeDetailModel!
                  .recipePicture,
            ),

            // Dark Overlay: Becomes more visible as the AppBar collapses
            AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: (1 - collapseRatio).clamp(0.0, 0.5),
              child: Container(
                // duration: Duration(milliseconds: 300),
                color: Colors.grey.shade900,
              ),
            ),

            Positioned(
              // top: collapseHeight / 2,
              top: collapseRatio <= titleAppearOnCollapseRatio
                  ? appearCollapseHeight / 2 + 8
                  : appBarImageInitialHeight / 5,
              left: 16.w,
              right: 16.w,
              child: RecipeDetailsAppBarItems(
                  collapseRatio: collapseRatio,
                  titleAppearOnCollapseRatio: titleAppearOnCollapseRatio),
            ),
          ],
        );
      }),

      backgroundColor: Colors.transparent, // Allow dynamic background
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(appearCollapseHeight),
        child: RecipeDetailsAppBarBottom(),
      ),
    );
  }
}
