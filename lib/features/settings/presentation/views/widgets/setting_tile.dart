import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  final IconData icon;
  const SettingTile({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        leading: Icon(
          icon,
          color: context.mainTextColor,
        ),
        title: Text(
          title,
          style: Styles.textStyleMedium15(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: Styles.textStyleMedium12(context).copyWith(
                color: context.secondaryTextColor,
              ),
            ),
            SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ],
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
