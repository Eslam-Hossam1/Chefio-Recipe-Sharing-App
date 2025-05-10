import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_follower_item.dart';
import 'package:flutter/material.dart';

class ChefFollowersListView extends StatelessWidget {
  const ChefFollowersListView({
    super.key,
    required this.scrollController,
    required this.chefConnections,
  });
  final ScrollController scrollController;
  final List<ChefConnectionEntity> chefConnections;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: EdgeInsets.only(top: 16),
      itemCount: chefConnections.length,
      itemBuilder: (context, index) => ChefFollowerItem(
        chefConnection: chefConnections[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 24,
      ),
    );
  }
}
