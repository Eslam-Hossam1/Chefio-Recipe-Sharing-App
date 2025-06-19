import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_connection_item.dart';
import 'package:flutter/material.dart';

class ChefConnectionsListView extends StatelessWidget {
  const ChefConnectionsListView({
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
      itemBuilder: (context, index) => ChefConnectionItem(
        chefConnection: chefConnections[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 24,
      ),
    );
  }
}
