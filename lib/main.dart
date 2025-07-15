
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold/app/gold_app.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/translations/codegen_loader.g.dart';

Future<void> main() async {
  await AppConfig.instance.initApp(appFlavor ?? 'dev');
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: GoldApp(),
    ),
  );
}
