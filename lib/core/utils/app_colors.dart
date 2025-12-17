import 'package:flutter/material.dart';

abstract class AppDarkColors {
  const AppDarkColors();

  static Color get primaryColor => const Color(0xFF16251E);

  static Color get secondaryColor => const Color(0xFF112117);

  static Color get thirdColor => const Color(0xFF00E377);

  static Color get transparent => Colors.transparent;

  static Color get whiteColor => Colors.white;

  static Color get white70Color => Colors.white70;

  static Color get white60Color => Colors.white60;

  static Color get white54Color => Colors.white54;

  static Color get white38Color => Colors.white38;

  static Color get white24Color => Colors.white24;

  static Color get white12Color => Colors.white12;

  static Color get white10Color => Colors.white10;

  static Color get blackColor => Colors.black;

  static Color get black87Color => Colors.black87;

  static Color get black54Color => Colors.black54;

  static Color get black45Color => Colors.black45;

  static Color get black38Color => Colors.black38;

  static Color get black26Color => Colors.black26;

  static Color get black12Color => Colors.black12;

  static Color get greyColor => Colors.grey;

  static Color get greyColor2 => const Color(0xFF1C2620);

  static Color get greenColor => Colors.green;

  static Color get redColor => Colors.red;

  static Color get redColor10 => Colors.red.withValues(alpha: 0.1);
}

abstract class AppLightColors {
  const AppLightColors();

  static Color get primaryColor => const Color(0xFFF5F9F7);

  static Color get secondaryColor => const Color(0xFFFFFFFF);

  static Color get thirdColor => const Color(0xFF00C566);

  static Color get transparent => Colors.transparent;

  static Color get whiteColor => Colors.white;

  static Color get blackColor => Colors.black;

  static Color get black87Color => Colors.black87;

  static Color get black54Color => Colors.black54;

  static Color get black45Color => Colors.black45;

  static Color get black38Color => Colors.black38;

  static Color get black26Color => Colors.black26;

  static Color get black12Color => Colors.black12;

  static Color get black10Color => Colors.black.withValues(alpha: 0.1);

  static Color get greyColor => Colors.grey;

  static Color get greyColor2 => const Color(0xFFE8EBE9);

  static Color get greyColor3 => const Color(0xFFF0F2F1);

  static Color get greenColor => Colors.green;

  static Color get redColor => Colors.red;

  static Color get redColor10 => Colors.red.withValues(alpha: 0.1);
}
