import 'package:gold/core/enums/ads_enums.dart';
import 'package:gold/core/services/logger/app_logger.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsRepo {
  AppOpenAd? _appOpenAd;
  bool _isShowingAppOpenAd = false;

  void loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: AdsType.openApp.adUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          AppLogger.instance.debug('AppOpenAd $ad loaded');
          _appOpenAd = ad;
          _showAppOpenAd();
        },
        onAdFailedToLoad: (error) {
          AppLogger.instance.debug('AppOpenAd failed to load: $error');
        },
      ),
    );
  }

  bool get isAppOpenAdAvailable {
    return _appOpenAd != null;
  }

  void _showAppOpenAd() {
    if (!isAppOpenAdAvailable) {
      AppLogger.instance.debug('Tried to show ad before available.');
      loadAppOpenAd();
      return;
    }
    if (_isShowingAppOpenAd) {
      AppLogger.instance.debug('Tried to show ad while already showing an ad.');
      return;
    }
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAppOpenAd = true;
        AppLogger.instance.debug('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        AppLogger.instance.debug(
          '$ad onAdFailedToShowFullScreenContent: $error',
        );
        _isShowingAppOpenAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        AppLogger.instance.debug('$ad onAdDismissedFullScreenContent');
        _isShowingAppOpenAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
    );
    _appOpenAd!.show();
  }

  InterstitialAd? _interstitialAd;

  bool get isInterstitialAdAvailable {
    return _interstitialAd != null;
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdsType.interstitial.adUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          AppLogger.instance.debug('interstitial $ad loaded');
          _interstitialAd = ad;
          _interstitialAd!.setImmersiveMode(true);
          _showInterstitialAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          AppLogger.instance.debug('InterstitialAd failed to load: $error.');
          _interstitialAd = null;
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (!isInterstitialAdAvailable) {
      AppLogger.instance.debug(
        'Warning: attempt to show interstitial before loaded.',
      );
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent:
          (InterstitialAd ad) =>
              AppLogger.instance.debug('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        AppLogger.instance.debug('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        AppLogger.instance.debug(
          '$ad onAdFailedToShowFullScreenContent: $error',
        );
        ad.dispose();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }
}
