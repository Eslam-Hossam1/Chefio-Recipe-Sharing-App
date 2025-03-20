import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/Glass_favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    required this.recipeModel,
  });
  final Recipe recipeModel;
  @override
  State<FavouriteIconButton> createState() => _FavouriteIconButtonState();
}

class _FavouriteIconButtonState extends State<FavouriteIconButton> {
  late bool isFavourte;
  @override
  void initState() {
    isFavourte = widget.recipeModel.likes is int;
    super.initState();
  }

  void toggle() {
    setState(() {
      isFavourte = !isFavourte;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggle();
        //request here
      },
      child: GlassFavouriteIcon(
        isFavourte: isFavourte,
      ),
    );
  }
}
