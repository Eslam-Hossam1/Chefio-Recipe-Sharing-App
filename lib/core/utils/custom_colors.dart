import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color mainTextColor;
  final Color secondaryTextColor;

  const CustomColors({
    required this.mainTextColor,
    required this.secondaryTextColor,
  });

  @override
  CustomColors copyWith({
    Color? mainTextColor,
    Color? secondaryTextColor,
  }) {
    return CustomColors(
      mainTextColor: mainTextColor ?? this.mainTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
    );
  }

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other == null) return this;
    return CustomColors(
      mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
    );
  }
}
