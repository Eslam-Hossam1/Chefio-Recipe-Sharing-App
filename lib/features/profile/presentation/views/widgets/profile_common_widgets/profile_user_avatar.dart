
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUserAvatar extends StatelessWidget {
  const ProfileUserAvatar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
        ProfileModel profileModel = context.read<ProfileCubit>().profileModel!;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CustomCachedNetworkImage(
                  url: profileModel.profile.profilePicture ??
                      Constants.nullUserImageUrl,
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
                url: profileModel.profile.profilePicture ??
                    Constants.nullUserImageUrl)),
      ),
    );
  }
}
