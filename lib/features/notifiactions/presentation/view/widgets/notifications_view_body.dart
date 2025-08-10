import 'package:chefio_app/core/utils/constants.dart';
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
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent *
            Constants.loadMoreTriggerRatio) {
      context.read<NotificationsCubit>().fetchNotifications();
    }
  }

  Future<void> _onRefresh() async {
    await context.read<NotificationsCubit>().refersh();
    _refreshController.refreshCompleted(); // Stop refresh indicator
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
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
          controller: _scrollController,
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
