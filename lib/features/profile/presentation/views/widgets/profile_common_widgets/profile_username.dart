import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUsername extends StatelessWidget {
  const ProfileUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProfileModel profileModel = context.read<ProfileCubit>().profileModel!;
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        profileModel.profile.username,
        style: Styles.textStyleBold17(context).copyWith(
          color: context.mainTextColor,
        ),
      ),
    );
  }
}
