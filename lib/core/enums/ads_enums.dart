import 'dart:io';

enum AdsType { banner, fluid, openApp, interstitial }

extension AdsTypeExtension on AdsType {
  String get adUnitId {
    return switch (this) {
      AdsType.banner =>
        Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/6300978111'
            : 'ca-app-pub-3940256099942544/2934735716',
      AdsType.fluid => '/6499/example/APIDemo/Fluid',
      AdsType.openApp =>
        Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/9257395921'
            : 'ca-app-pub-3940256099942544/5575463023',
      AdsType.interstitial =>
        Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910',
    };
  }
}
