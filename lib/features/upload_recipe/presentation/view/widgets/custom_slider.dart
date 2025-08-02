import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/upload_recipe/presentation/manager/upload_recipe_form_cubit/upload_recipe_form_cubit.dart';
import 'package:chefio_app/features/upload_recipe/presentation/view/widgets/slider_duration_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Customslider extends StatefulWidget {
  const Customslider({
    super.key,
    this.initialCurrentValue,required this.onChangeEnd,
  });
  final int? initialCurrentValue;
  final void Function(double) onChangeEnd;
  @override
  State<Customslider> createState() => _CustomsliderState();
}

class _CustomsliderState extends State<Customslider> {
  late double currentValue;
  @override
  void initState() {
    currentValue = widget.initialCurrentValue?.toDouble() ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SliderDurationLabel(duration: 1, currentValue: currentValue.round()),
          SliderDurationLabel(duration: 45, currentValue: currentValue.round()),
          SliderDurationLabel(duration: 90, currentValue: currentValue.round()),
        ]),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 8,
          ),
          child: Slider(
            divisions: 90,
            label: '${currentValue.round()}',
            thumbColor: context.primaryColor,
            activeColor: context.primaryColor,
            inactiveColor: context.formColor,
            value: currentValue,
            min: 1,
            max: 90,
            onChangeEnd: widget.onChangeEnd,
            onChanged: (value) {
              setState(() {
                currentValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
