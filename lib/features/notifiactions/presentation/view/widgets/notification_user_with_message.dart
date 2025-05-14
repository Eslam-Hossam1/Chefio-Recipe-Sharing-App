import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_circle_image.dart';
import 'package:flutter/material.dart';

class NotificationUserWithMessage extends StatelessWidget {
  const NotificationUserWithMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomNetworkCircleImage(
          baseSize: 52,
          userImageUrl:
              'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTot_2nt2IYzwGxAWxfAjyKgVpySMWB5wqYRBrOUH_lxG0xBHO52fKJz584EXEZFjmGhfCz8n8s-yakaISpgJ2PkQ',
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              'Belle Eillish',
              style: Styles.textStyleBold15(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              'now following you ・ 1h',
              style: Styles.textStyleMedium12(context).copyWith(
                color: context.secondaryTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
