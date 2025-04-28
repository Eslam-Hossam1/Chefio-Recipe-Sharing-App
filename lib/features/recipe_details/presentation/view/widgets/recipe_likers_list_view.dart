import 'package:chefio_app/features/recipe_details/data/models/recipe_liker_model/recipe_liker_model.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/user_tile_item.dart';
import 'package:flutter/material.dart';

class RecipeLikersListView extends StatelessWidget {
  const RecipeLikersListView({
    super.key,
    required this.scrollController,
    required this.recipeLikers,
  });
  final ScrollController scrollController;
  final List<RecipeLikerModel> recipeLikers;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: EdgeInsets.only(top: 16),
      itemCount: recipeLikers.length,
      itemBuilder: (context, index) => UserTileItem(
        userName: recipeLikers[index].user.username,
        baseSize: 50,
        userImageUrl: recipeLikers[index].user.profilePicture,
        intermediateSpace: 16,
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 24,
      ),
    );
  }
}
