import 'dart:io';

enum AdsType { banner, fluid, openApp, interstitial }

extension AdsTypeExtension on AdsType {
  String get adUnitId {
    return switch (this) {
      AdsType.banner =>
        Platform.isAndroid
            ? 'ca-app-pub-1886707841143443/5011872617'
            : 'ca-app-pub-1886707841143443/5941810901',
      AdsType.fluid =>
        Platform.isAndroid
            ? 'ca-app-pub-1886707841143443/4409237387'
            : 'ca-app-pub-1886707841143443/1055513401',
      AdsType.openApp =>
        Platform.isAndroid
            ? 'ca-app-pub-1886707841143443/9532769224'
            : 'ca-app-pub-1886707841143443/1755153884',
      AdsType.interstitial =>
        Platform.isAndroid
            ? 'ca-app-pub-1886707841143443/8546990616'
            : 'ca-app-pub-1886707841143443/8934003424',
    };
  }
}
