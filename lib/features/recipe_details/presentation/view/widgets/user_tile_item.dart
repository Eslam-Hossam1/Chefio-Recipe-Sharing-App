import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_circle_image.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTileItem extends StatelessWidget {
  const UserTileItem({
    super.key,
    required this.userName,
    this.userImageUrl,
    this.baseSize = Constants.userTileImageSize,
    this.intermediateSpace = 12,
  });
  final String userName;
  final String? userImageUrl;
  final double baseSize;
  final double intermediateSpace;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomNetworkCircleImage(
            baseSize: baseSize, userImageUrl: userImageUrl),
        SizedBox(
          width: intermediateSpace.w,
        ),
        Expanded(
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            userName,
            style: Styles.textStyleBold17(context)
                .copyWith(color: context.mainTextColor),
          ),
        ),
      ],
    );
  }
}
