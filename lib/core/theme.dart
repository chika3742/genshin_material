import "package:flutter/material.dart";

class ComponentThemeExtension extends ThemeExtension<ComponentThemeExtension> {
  final Color? starColor;
  final Color? rarity1Color;
  final Color? rarity2Color;
  final Color? rarity3Color;
  final Color? rarity4Color;
  final Color? rarity5Color;

  ComponentThemeExtension({
    required this.starColor,
    required this.rarity1Color,
    required this.rarity2Color,
    required this.rarity3Color,
    required this.rarity4Color,
    required this.rarity5Color,
  });

  @override
  ThemeExtension<ComponentThemeExtension> copyWith({
    Color? starColor,
    Color? rarity1Color,
    Color? rarity2Color,
    Color? rarity3Color,
    Color? rarity4Color,
    Color? rarity5Color,
  }) {
    return ComponentThemeExtension(
      starColor: starColor ?? this.starColor,
      rarity1Color: rarity1Color ?? this.rarity1Color,
      rarity2Color: rarity2Color ?? this.rarity2Color,
      rarity3Color: rarity3Color ?? this.rarity3Color,
      rarity4Color: rarity4Color ?? this.rarity4Color,
      rarity5Color: rarity5Color ?? this.rarity5Color,
    );
  }

  @override
  ThemeExtension<ComponentThemeExtension> lerp(covariant ComponentThemeExtension other, double t) {
    return ComponentThemeExtension(
      starColor: Color.lerp(starColor, other.starColor, t),
      rarity1Color: Color.lerp(rarity1Color, other.rarity1Color, t),
      rarity2Color: Color.lerp(rarity2Color, other.rarity2Color, t),
      rarity3Color: Color.lerp(rarity3Color, other.rarity3Color, t),
      rarity4Color: Color.lerp(rarity4Color, other.rarity4Color, t),
      rarity5Color: Color.lerp(rarity5Color, other.rarity5Color, t),
    );
  }

  Color getRarityColor(int rarity) {
    switch (rarity) {
      case 1:
        return rarity1Color!;
      case 2:
        return rarity2Color!;
      case 3:
        return rarity3Color!;
      case 4:
        return rarity4Color!;
      case 5:
        return rarity5Color!;
      default:
        return Colors.transparent;
    }
  }
}
