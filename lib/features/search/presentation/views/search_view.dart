import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
          child: Text(
            'recipe details',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            context.push(RoutePaths.recipeDetails);
          },
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextButton(
          child: Text(
            'recipe details deep',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            context.go(
              RoutePaths.recipeDetails,
            );
          },
        ),
      ],
    );
  }
}
