import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_follow_button_cubit/profile_follow_button_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_follow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileFollowButtonBuilder extends StatefulWidget {
  const ProfileFollowButtonBuilder({
    super.key,
  });

  @override
  State<ProfileFollowButtonBuilder> createState() =>
      _ProfileFollowButtonBuilderState();
}

class _ProfileFollowButtonBuilderState
    extends State<ProfileFollowButtonBuilder> {
  @override
  void initState() {
    context.read<ProfileFollowButtonCubit>().checkIsMyProfile(
          chefId: context.read<ProfileCubit>().chefId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFollowButtonCubit, ProfileFollowButtonState>(
      builder: (context, state) {
        if (state is NotMyProfile) {
          return ProfileFollowButton();
        } else {
          return SizedBox(
            height: 24,
          );
        }
      },
    );
  }
}
