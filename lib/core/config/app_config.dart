import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gold/core/services/cache/cache_service.dart';
import 'package:gold/core/services/di/di.dart';
import 'package:gold/core/services/notifications/notifications_service.dart';
import 'package:gold/core/themes/app_colors.dart';
import 'package:gold/core/utils/cache_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gold/firebase_options_dev.dart' as dev;
import 'package:gold/firebase_options_sa.dart' as sa;
import 'package:gold/core/themes/app_colors_dev.dart' as dev_colors;
import 'package:gold/core/themes/app_colors_sa.dart' as sa_colors;

class AppConfig {
  static AppConfig? _instance;

  static AppConfig get instance => _instance ??= AppConfig._();

  AppConfig._();

  String baseUrl = '';
  String appLogo = '';
  String appName = '';
  String currentFlavor = '';
  AppColors? lightColors;
  AppColors? darkColors;

  Future<void> initApp(String flavor) async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    currentFlavor = flavor;
    appLogo = 'assets/$flavor/logo.png';
    appName = 'Gold $flavor';
    baseUrl = 'https://api.$flavor.com/api/v3/';
    setUp();
    initializeColors(flavor);
    await Future.wait([Hive.initFlutter(), initializeFirebaseApp(flavor)]);
    await Future.wait([
      getIt.get<CacheService>().init(CacheConstants.appBox + flavor),
      NotificationsService.init(),
    ]);

    FlutterNativeSplash.remove();
  }

  Future<void> initializeFirebaseApp(String flavor) async {
    final firebaseOptions = switch (flavor) {
      'dev' => dev.DefaultFirebaseOptions.currentPlatform,
      'sa' => sa.DefaultFirebaseOptions.currentPlatform,
      _ => throw UnsupportedError('Invalid flavor: $flavor'),
    };
    await Firebase.initializeApp(options: firebaseOptions);
  }

  void initializeColors(String flavor) {
    switch (flavor) {
      case 'dev':
        {
          lightColors = dev_colors.LightColorsDev.instance;
          darkColors = dev_colors.DarkColorsDev.instance;
        }
      case 'sa':
        {
          lightColors = sa_colors.LightColorsDev.instance;
          darkColors = sa_colors.DarkColorsDev.instance;
        }
      default:
        throw UnsupportedError('Invalid flavor: $flavor');
    }
  }
}
