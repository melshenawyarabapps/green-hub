import 'package:gold/core/themes/app_colors.dart';

class LightColorsProd extends AppColors {
  static LightColorsProd? _instance;

  static LightColorsProd get instance => _instance ??= const LightColorsProd._();

  const LightColorsProd._();
}

class DarkColorsProd extends AppColors {
  static DarkColorsProd? _instance;

  static DarkColorsProd get instance => _instance ??= const DarkColorsProd._();

  const DarkColorsProd._();

}
