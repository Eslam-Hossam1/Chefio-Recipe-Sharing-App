import 'dart:developer';
import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_circle_glass_button.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_app_bar_bottom.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeDetailsCustomAppBar extends StatelessWidget {
  const RecipeDetailsCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double leadingItemHeight = 56;
    double bottomheight = 48;
    double appBarImageInitialHeight = MediaQuery.sizeOf(context).height * .46;
    double collapseHeight =
        (MediaQuery.sizeOf(context).height * .1 + (leadingItemHeight / 2))
            .clamp((kToolbarHeight * 1.5), (kToolbarHeight * 2));
    return SliverAppBar(
      pinned: true,
      expandedHeight: appBarImageInitialHeight,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        // Calculate the collapse ratio
        double collapseRatio =
            (constraints.maxHeight - collapseHeight - bottomheight - 8) /
                (appBarImageInitialHeight - collapseHeight - bottomheight - 8);
        collapseRatio = collapseRatio.clamp(0.0, 1.0);
        // log('maxHeight: ${constraints.maxHeight} , collapseheight: ${collapseHeight}  , expandedheight: ${appBarImageInitialHeight} , collapseRatio: ${collapseRatio}');

        return Stack(
          fit: StackFit.expand,
          children: [
            // Recipe Image
            Image.asset(
              Assets.imagesFoodDetailsPictureTest,
              fit: BoxFit.cover,
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
              top: collapseHeight / 2,
              left: 16.w,
              right: 16.w,
              child: Row(
                children: [
                  RecipeDetailsBackButton(),
                  SizedBox(
                    width: 12.w,
                  ),
                  // Recipe Title: Appears when the AppBar is collapsed

                  Expanded(
                    child: AnimatedOpacity(
                      opacity: collapseRatio <= 0.3
                          ? 1.0
                          : 0.0, // Show when collapsed
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Recipe Titleasjkdfkasjdfkljaskldfjaskldfja;klsdfjkasdjklasdjfklasdfj;",
                        style: Styles.textStyleBold17(context).copyWith(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomCircleGlassButton(
                    child: SvgPicture.asset(
                      Assets.imagesIosBackOutline,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),

      backgroundColor: Colors.transparent, // Allow dynamic background
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(collapseHeight),
        child: RecipeDetailsAppBarBottom(),
      ),
    );
  }
}
