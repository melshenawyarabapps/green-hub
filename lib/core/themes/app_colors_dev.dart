import 'package:gold/core/themes/app_colors.dart';

import 'package:flutter/material.dart';

class LightColorsDev extends AppColors {
  static LightColorsDev? _instance;

  static LightColorsDev get instance => _instance ??= const LightColorsDev._();

  const LightColorsDev._();
}

class DarkColorsDev extends AppColors {
  static DarkColorsDev? _instance;

  static DarkColorsDev get instance => _instance ??= const DarkColorsDev._();

  const DarkColorsDev._();

}
