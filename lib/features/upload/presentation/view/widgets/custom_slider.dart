import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/slider_duration_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Customslider extends StatefulWidget {
  const Customslider({
    super.key,
  });

  @override
  State<Customslider> createState() => _CustomsliderState();
}

class _CustomsliderState extends State<Customslider> {
  late double currentValue;
  @override
  void initState() {
    currentValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SliderDurationLabel(
              text: "<10",
              active: true,
            ),
            SliderDurationLabel(
              text: "30",
              active: currentValue >= 30.0,
            ),
            SliderDurationLabel(
              text: ">60",
              active: currentValue >= 60.0,
            ),
          ],
        ),
        Slider(
          thumbColor: context.primaryColor,
          activeColor: context.primaryColor,
          inactiveColor: context.formColor,
          value: currentValue,
          min: 0,
          max: 60,
          onChangeEnd: (cookDuration) {
            context.read<UploadRecipeCubit>().foodCookDuration =
                cookDuration.toInt();
          },
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
          },
        ),
      ],
    );
  }
}
