import 'dart:ui';

 class FontWeights {
  FontWeights._();

  static FontWeights? _instance;

  static FontWeights get instance => _instance ??= FontWeights._();

   FontWeight get light => FontWeight.w300;
   FontWeight get regular => FontWeight.normal;
   FontWeight get medium => FontWeight.w500;
   FontWeight get semiBold => FontWeight.w600;
   FontWeight get bold => FontWeight.bold;
}
