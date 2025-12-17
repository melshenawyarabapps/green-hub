import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/core/services/cache/cache_service.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/services/observers/bloc_lifecycle_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:greenhub/firebase_options_delivery.dart' as delivery;
import 'package:greenhub/firebase_options_user.dart' as user;

class AppConfig {
  static AppConfig? _instance;

  static AppConfig get instance => _instance ??= AppConfig._();

  AppConfig._();

  String appName = '';
  String currentFlavor = '';

  Future<void> initApp(String flavor) async {
    WidgetsFlutterBinding.ensureInitialized();
    currentFlavor = flavor;
    appName = 'ShipHub $flavor';
    setUp();
    if (kDebugMode) {
      Bloc.observer = BlocLifecycleObserver.instance;
    }
    await Future.wait([
      getIt.get<CacheService>().init(),
      initializeFirebaseApp(flavor),
    ]);
  }

  Future<void> initializeFirebaseApp(String flavor) async {
    final firebaseOptions = switch (flavor) {
      'user' => user.DefaultFirebaseOptions.currentPlatform,
      'delivery' => delivery.DefaultFirebaseOptions.currentPlatform,
      _ => throw UnsupportedError('Invalid flavor: $flavor'),
    };
    await Firebase.initializeApp(options: firebaseOptions);
  }
}
