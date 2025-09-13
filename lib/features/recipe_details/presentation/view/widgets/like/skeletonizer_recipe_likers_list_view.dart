import 'package:chefio_app/features/recipe_details/data/models/recipe_liker_model/recipe_liker_model.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_liker_model/user.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/like/recipe_likers_list_view.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerRecipeLikersListView extends StatelessWidget {
  const SkeletonizerRecipeLikersListView({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: RecipeLikersListView(
        scrollController: scrollController,
        recipeLikers: List.generate(
          20,
          (index) => RecipeLikerModel(
            id: '${index + 1}',
            user: User(
              id: '${index + 1}',
              username: 'Eslam Hossam Eslam Hossam ${index + 1}',
            ),
          ),
        ),
      ),
    );
  }
}
