import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/follow_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationFollowButton extends StatelessWidget {
  const NotificationFollowButton({
    super.key,
    required this.notificationEntity,
  });
  final NotificationEntity notificationEntity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FollowChefCubit, FollowChefState>(
      listener: (context, state) {
        if ((state is FollowChefSuccess ) &&
            state.chefId ==
                notificationEntity.chefId) {
          notificationEntity.isFollowing = !notificationEntity.isFollowing!;
        }
        if (state is FollowChefFaiure) {
            showCustomToast(
              context,
              message: state.errorLocalizationKey.tr(),
              seconds: 2,
            );
          }
      },
      builder: (context, state) {
        final isLoading = state is FollowChefLoading &&
            state.chefId == notificationEntity.chefId;
        return FollowButton(
          isLoading: isLoading,
          isFollowing: notificationEntity
              .isFollowing!, // Assuming the follow state is false for this example
          onPressed: () {
            context.read<FollowChefCubit>().toggleFollowChef(
                  chefId: notificationEntity.chefId,
                  isFollowing: notificationEntity.isFollowing!
                );
          },
        );
      },
    );
  }
}
