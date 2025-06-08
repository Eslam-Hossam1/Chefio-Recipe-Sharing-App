import 'package:chefio_app/features/notifiactions/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notifications_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  initState() {
    super.initState();
    context.read<NotificationsCubit>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationsViewBody(),
      ),
    );
  }
}
