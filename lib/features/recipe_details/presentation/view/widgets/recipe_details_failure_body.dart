import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_info_message.dart';
import 'package:flutter/material.dart';

class RecipeDetailsFailureBody extends StatelessWidget {
  const RecipeDetailsFailureBody({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextInfoMessage(
          text: text,
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextButton(child: Text('try again'))
      ],
    );
  }
}
