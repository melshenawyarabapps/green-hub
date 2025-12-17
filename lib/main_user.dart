
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenhub/apps/user_app.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/translations/codegen_loader.g.dart';

Future<void> main() async {
  await AppConfig.instance.initApp(appFlavor ?? 'user');
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: UserApp(),
    ),
  );
}
