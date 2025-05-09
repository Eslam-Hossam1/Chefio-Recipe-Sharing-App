import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUserAvatarWithTitle extends StatelessWidget {
  const ProfileUserAvatarWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileModel profileModel = context.read<ProfileCubit>().profileModel!;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: CustomCachedNetworkImage(
                        url: profileModel.profile.profilePicture??Constants.nullProfileUserImageUrl,
                      ),
                    );
                  });
            },
            child: Center(
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: (100.w).clamp(80, 140),
                  width: (100.w).clamp(80, 140),
                  child: CustomCachedNetworkImage(
                      url: profileModel.profile.profilePicture??Constants.nullProfileUserImageUrl)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              profileModel.profile.username,
              style: Styles.textStyleBold17(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
