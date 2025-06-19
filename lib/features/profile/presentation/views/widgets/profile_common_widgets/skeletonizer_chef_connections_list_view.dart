import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_connections_list_view.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_liker_model/recipe_liker_model.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_liker_model/user.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_likers_list_view.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerChefConnectionsListView extends StatelessWidget {
  const SkeletonizerChefConnectionsListView({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ChefConnectionsListView(
        scrollController: scrollController,
        chefConnections: List.generate(
          20,
          (index) => ChefConnectionEntity(
              chefId: '${index + 1}',
              chefUsername: 'eslam hossam ${index + 1}',
              isFollowing: false,
              chefProfilePicture: null),
        ),
      ),
    );
  }
}
