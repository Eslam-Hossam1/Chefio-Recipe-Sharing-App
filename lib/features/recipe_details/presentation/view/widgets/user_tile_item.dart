import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTileItem extends StatelessWidget {
  const UserTileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(shape: BoxShape.circle),
          height: (32.w).clamp(32, 40),
          width: (32.w).clamp(32, 40),
          child: CustomCachedNetworkImage(
              url: context
                      .read<RecipeDetailsCubit>()
                      .recipeDetailModel!
                      .createdBy
                      .profilePicture ??
                  Constants.nullProfileUserImageUrl),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            context
                .read<RecipeDetailsCubit>()
                .recipeDetailModel!
                .createdBy
                .username,
            style: Styles.textStyleBold17(context)
                .copyWith(color: context.mainTextColor),
          ),
        ),
      ],
    );
  }
}
