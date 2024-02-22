import "package:flutter/material.dart";

class ComponentThemeExtension extends ThemeExtension<ComponentThemeExtension> {
  final Color? starColor;

  ComponentThemeExtension({
    required this.starColor,
  });

  @override
  ThemeExtension<ComponentThemeExtension> copyWith({Color? starColor}) {
    return ComponentThemeExtension(
      starColor: starColor ?? this.starColor,
    );
  }

  @override
  ThemeExtension<ComponentThemeExtension> lerp(covariant ComponentThemeExtension other, double t) {
    return ComponentThemeExtension(
      starColor: Color.lerp(starColor, other.starColor, t),
    );
  }
}
