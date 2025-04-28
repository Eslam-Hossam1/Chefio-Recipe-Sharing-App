import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImageSourceBottomSheet extends StatelessWidget {
  const ChooseImageSourceBottomSheet({
    super.key,
    required this.pickImageMethod,
  });
  final Function({required ImageSource imageSource}) pickImageMethod;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () async {
                await pickImageMethod(imageSource: ImageSource.gallery);
                if (!context.mounted) return;
                context.pop();
              },
              child: ListTile(
                title: Text(
                  'Take from Gallery',
                  style: Styles.textStyleMedium17(context)
                      .copyWith(color: context.mainTextColor),
                ),
              )),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () async {
                await pickImageMethod(imageSource: ImageSource.camera);
                if (!context.mounted) return;
                context.pop();
              },
              child: ListTile(
                title: Text(
                  'Take from Camera',
                  style: Styles.textStyleMedium17(context)
                      .copyWith(color: context.mainTextColor),
                ),
              )),
        ],
      ),
    );
  }
}
