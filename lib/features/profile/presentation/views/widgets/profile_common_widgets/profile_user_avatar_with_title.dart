import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_user_avatar.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_username.dart';
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
          ProfileUserAvatar(),
          SizedBox(
            height: 24,
          ),
          ProfileUsername(),
        ],
      ),
    );
  }
}
