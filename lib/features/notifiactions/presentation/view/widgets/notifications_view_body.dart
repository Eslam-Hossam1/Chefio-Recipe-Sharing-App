import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/notifiactions/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notifications_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  Future<void> _onRefresh() async {
    await context.read<NotificationsCubit>().fetchNotifications();
    _refreshController.refreshCompleted(); // Stop refresh indicator
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      child: SmartRefresher(
        onRefresh: _onRefresh,
        controller: _refreshController,
        header: ClassicHeader(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            NotificationsListBuilder()
          ],
        ),
      ),
    );
  }
}
