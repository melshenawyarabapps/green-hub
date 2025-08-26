import 'package:cached_network_image_plus/cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gold/core/services/cache/cache_service.dart';
import 'package:gold/core/services/di/di.dart';
import 'package:gold/core/services/notifications/notifications_service.dart';
import 'package:gold/core/services/observers/bloc_lifecycle_observer.dart';
import 'package:gold/core/themes/app_colors.dart';
import 'package:gold/core/utils/cache_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gold/firebase_options_dev.dart' as dev;
import 'package:gold/firebase_options_prod.dart' as prod;
import 'package:gold/core/themes/app_colors_dev.dart';
import 'package:gold/core/themes/app_colors_prod.dart';

class AppConfig {
  static AppConfig? _instance;

  static AppConfig get instance => _instance ??= AppConfig._();

  AppConfig._();

  String baseUrl = '';
  String appLogo = '';
  String appCurrency = '';
  String appName = '';
  String currentFlavor = '';
  AppColors? lightColors;
  AppColors? darkColors;

  Future<void> initApp(String flavor) async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    currentFlavor = flavor;
    appLogo = 'assets/$flavor/logo.png';
    appCurrency = 'assets/$flavor/currency.png';
    appName = 'Gold $flavor';
    baseUrl = 'https://produdy.plusprices.net/api/v1';
    setUp();
    if (flavor == 'dev') {
      Bloc.observer = BlocLifecycleObserver.instance;
    }
    initializeColors(flavor);
    await Future.wait([
      Hive.initFlutter(),
      initializeFirebaseApp(flavor),
    ]);
    await Future.wait([
      getIt.get<CacheService>().init(CacheConstants.appBox + flavor),
      NotificationsService.init(),
      CacheImageService.init(),
    ]);
  }

  Future<void> initializeFirebaseApp(String flavor) async {
    final firebaseOptions = switch (flavor) {
      'dev' => dev.DefaultFirebaseOptions.currentPlatform,
      'prod' => prod.DefaultFirebaseOptions.currentPlatform,
      _ => throw UnsupportedError('Invalid flavor: $flavor'),
    };
    await Firebase.initializeApp(options: firebaseOptions);
  }

  void initializeColors(String flavor) {
    switch (flavor) {
      case 'dev':
        {
          lightColors = LightColorsDev.instance;
          darkColors = DarkColorsDev.instance;
        }
      case 'prod':
        {
          lightColors = LightColorsProd.instance;
          darkColors = DarkColorsProd.instance;
        }
      default:
        throw UnsupportedError('Invalid flavor: $flavor');
    }
  }
}
