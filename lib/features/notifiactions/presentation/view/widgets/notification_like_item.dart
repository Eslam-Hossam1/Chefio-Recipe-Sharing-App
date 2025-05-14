
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_recipe_Image.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_user_with_message.dart';
import 'package:flutter/material.dart';

class NotificationLikeItem extends StatelessWidget {
  const NotificationLikeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NotificationUserWithMessage(),
        Spacer(),
        NotificationRecipeImage(),
      ],
    );
  }
}
