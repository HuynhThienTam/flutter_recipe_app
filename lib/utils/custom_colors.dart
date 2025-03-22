import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final MaterialColor neutral;

  const CustomColors({required this.neutral});

  @override
  CustomColors copyWith({MaterialColor? neutral}) {
    return CustomColors(
      neutral: neutral ?? this.neutral,
    );
  }

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other == null) return this;
    return CustomColors(
      neutral: other.neutral, // Just return the other neutral color
    );
  }
}
