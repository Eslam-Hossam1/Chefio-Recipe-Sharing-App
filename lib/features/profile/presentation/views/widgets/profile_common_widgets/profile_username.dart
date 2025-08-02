import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUsername extends StatelessWidget {
  const ProfileUsername({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
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
