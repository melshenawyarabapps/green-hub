import 'package:gold/core/themes/app_colors.dart';

import 'package:flutter/material.dart';

class LightColorsDev implements AppColors {
  static LightColorsDev? _instance;

  static LightColorsDev get instance => _instance ??= const LightColorsDev._();

  const LightColorsDev._();

  @override
  Color get primaryColor => Color(0xff20043d);

  @override
  Color get secondaryColor => Color(0xff1d1586);

  @override
  Color get thirdColor => Color(0xff16042c);

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get whiteColor => Colors.white;

  @override
  Color get white70Color => Colors.white70;

  @override
  Color get white60Color => Colors.white60;

  @override
  Color get white54Color => Colors.white54;

  @override
  Color get white38Color => Colors.white38;

  @override
  Color get white24Color => Colors.white24;

  @override
  Color get white12Color => Colors.white12;

  @override
  Color get white10Color => Colors.white10;

  @override
  Color get blackColor => Colors.black;

  @override
  Color get black87Color => Colors.black87;

  @override
  Color get black54Color => Colors.black54;

  @override
  Color get black45Color => Colors.black45;

  @override
  Color get black38Color => Colors.black38;

  @override
  Color get black26Color => Colors.black26;

  @override
  Color get black12Color => Colors.black12;

  @override
  Color get greyColor1 => Colors.grey;

  @override
  Color get primary900Color => Color(0xff141926);

  @override
  Color get greenColor1 => Colors.green;

  @override
  Color get redColor1 => Colors.red;
}

class DarkColorsDev implements AppColors {
  static DarkColorsDev? _instance;

  static DarkColorsDev get instance => _instance ??= const DarkColorsDev._();

  const DarkColorsDev._();


  @override
  Color get primaryColor => Color(0xff1b212f);

  @override
  Color get secondaryColor => Color(0xffedc781);

  @override
  Color get thirdColor => Color(0xff033648);

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get whiteColor => Colors.white;

  @override
  Color get white70Color => Colors.white70;

  @override
  Color get white60Color => Colors.white60;

  @override
  Color get white54Color => Colors.white54;

  @override
  Color get white38Color => Colors.white38;

  @override
  Color get white24Color => Colors.white24;

  @override
  Color get white12Color => Colors.white12;

  @override
  Color get white10Color => Colors.white10;

  @override
  Color get blackColor => Colors.black;

  @override
  Color get black87Color => Colors.black87;

  @override
  Color get black54Color => Colors.black54;

  @override
  Color get black45Color => Colors.black45;

  @override
  Color get black38Color => Colors.black38;

  @override
  Color get black26Color => Colors.black26;

  @override
  Color get black12Color => Colors.black12;

  @override
  Color get greyColor1 => Colors.grey;

  @override
  Color get primary900Color => Color(0xff141926);
  @override
  Color get greenColor1 => Colors.green;

  @override
  Color get redColor1 => Colors.red;
}
