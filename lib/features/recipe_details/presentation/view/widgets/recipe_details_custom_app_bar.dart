import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_circle_glass_button.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_app_bar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeDetailsCustomAppBar extends StatelessWidget {
  const RecipeDetailsCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double appBarImageInitialHeight = MediaQuery.sizeOf(context).height * .46;
    double collapseHeight = (MediaQuery.sizeOf(context).height * .1 + 28)
        .clamp((kToolbarHeight * 1.5), (kToolbarHeight * 2));
    return SliverAppBar(
      pinned: true,
      expandedHeight: appBarImageInitialHeight,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        // Calculate the collapse ratio
        double collapseRatio = (constraints.maxHeight - collapseHeight) /
            (MediaQuery.sizeOf(context).height * .4 - collapseHeight);
        collapseRatio = collapseRatio.clamp(0.0, 1.0);

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
              opacity: 1 - collapseRatio,
              child: Container(
                // duration: Duration(milliseconds: 300),
                color: Colors.grey.shade900,
              ),
            ),

            // Recipe Title: Appears when the AppBar is collapsed
            Positioned(
              top: collapseHeight / 2, // Align title at toolbar height
              left: 16.w,

              right: 16.w,
              child: Row(
                children: [
                  CustomCircleGlassButton(
                    child: SvgPicture.asset(
                      Assets.imagesIosBackOutline,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: AnimatedOpacity(
                      opacity: collapseRatio <= 0.5
                          ? 1.0
                          : 0.0, // Show when collapsed
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Recipe Titleasjkdfkasjdfkljaskldfjaskldfja;klsdfjkasdjklasdjfklasdfj;",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
