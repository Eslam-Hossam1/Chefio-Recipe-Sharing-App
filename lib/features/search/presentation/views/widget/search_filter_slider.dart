
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/slider_duration_label.dart';
import 'package:flutter/material.dart';

class SearchFilterSlider extends StatefulWidget {
  const SearchFilterSlider({super.key});

  @override
  State<SearchFilterSlider> createState() => _SearchFilterSliderState();
}

class _SearchFilterSliderState extends State<SearchFilterSlider> {
  late double currentValue;
  @override
  void initState() {
    currentValue = 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SliderDurationLabel(
              text: '<10', duration: 10, currentValue: currentValue.round()),
          SliderDurationLabel(
              text: '30', duration: 30, currentValue: currentValue.round()),
          SliderDurationLabel(
              text: '>60', duration: 60, currentValue: currentValue.round()),
        ]),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 8,
          ),
          child: Slider(
            // divisions: 90,
            // label: '${currentValue.round()}',
            thumbColor: context.primaryColor,
            activeColor: context.primaryColor,
            inactiveColor: context.formColor,
            value: currentValue,
            min: 10,
            max: 60,
            onChangeEnd: (cookDuration) {},
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
