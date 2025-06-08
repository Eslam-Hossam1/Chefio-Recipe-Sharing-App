
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_info_message_with_button.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_info_message.dart';
import 'package:chefio_app/features/notifiactions/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/sliver_notifications_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsListBuilder extends StatelessWidget {
  const NotificationsListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomTextInfoMessage(
              text: 'there is no notifications',
            ),
          );
        } else if (state is NotificationsFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomInfoMessageWithButton(
              message: state.errorLocalizationKey.tr(),
              btnText: 'try again',
              onPressed: context.read<NotificationsCubit>().fetchNotifications,
            ),
          );
        } else if (state is NotificationsSuccess) {
          return SliverNotificationsList();
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomCircularProgressIndicator(),
          );
        }
      },
    );
  }
}
