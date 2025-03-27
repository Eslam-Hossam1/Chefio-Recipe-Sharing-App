
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeDetailsCustomLike extends StatefulWidget {
  const RecipeDetailsCustomLike({
    super.key,
    required this.likes,
    required this.isLiked,
  });
  final int likes;
  final bool isLiked;

  @override
  State<RecipeDetailsCustomLike> createState() =>
      _RecipeDetailsCustomLikeState();
}

class _RecipeDetailsCustomLikeState extends State<RecipeDetailsCustomLike> {
  late bool isLiked;
  late int likes;
  @override
  void initState() {
    isLiked = widget.isLiked;
    likes = widget.likes;
    super.initState();
  }

  void toggleLike() {
    setState(() {
      likes = isLiked ? likes - 1 : likes + 1;
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: toggleLike,
          child: CircleAvatar(
            backgroundColor:
                isLiked ? context.primaryColor : context.outlineColor,
            child: Center(
                child: SvgPicture.asset(
              Assets.imagesLikesHeart,
            )),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          '$likes Likes',
          style: Styles.textStyleBold17(context)
              .copyWith(color: context.mainTextColor),
        ),
      ],
    );
  }
}
