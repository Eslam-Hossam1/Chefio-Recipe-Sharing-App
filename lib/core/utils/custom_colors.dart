import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color mainTextColor;
  final Color secondaryTextColor;
  final Color formColor;
  final Color toastColor;
  const CustomColors({
    required this.mainTextColor,
    required this.secondaryTextColor,
    required this.formColor,
    required this.toastColor,
  });

  @override
  CustomColors copyWith({
    Color? mainTextColor,
    Color? secondaryTextColor,
    Color? formColor,
    Color? toastColor,
    
  }) {
    return CustomColors(
      mainTextColor: mainTextColor ?? this.mainTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      formColor: formColor ?? this.formColor,
      toastColor: toastColor ?? this.toastColor,
    );
  }

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other == null) return this;
    return CustomColors(
      mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      formColor: Color.lerp(formColor, other.formColor, t)!,
      toastColor: Color.lerp(toastColor, other.toastColor, t)!,
    );
  }
}
