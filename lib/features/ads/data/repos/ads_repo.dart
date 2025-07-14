import 'dart:developer';

import 'package:gold/core/enums/ads_enums.dart';
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
          log('AppOpenAd $ad loaded');
          _appOpenAd = ad;
          _showAppOpenAd();
        },
        onAdFailedToLoad: (error) {
          log('AppOpenAd failed to load: $error');
        },
      ),
    );
  }

  bool get isAppOpenAdAvailable {
    return _appOpenAd != null;
  }

  void _showAppOpenAd() {
    if (!isAppOpenAdAvailable) {
      log('Tried to show ad before available.');
      loadAppOpenAd();
      return;
    }
    if (_isShowingAppOpenAd) {
      log('Tried to show ad while already showing an ad.');
      return;
    }
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAppOpenAd = true;
        log('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        log('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAppOpenAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        log('$ad onAdDismissedFullScreenContent');
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
          log('interstitial $ad loaded');
          _interstitialAd = ad;
          _interstitialAd!.setImmersiveMode(true);
          _showInterstitialAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          log('InterstitialAd failed to load: $error.');
          _interstitialAd = null;
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (!isInterstitialAdAvailable) {
      log('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent:
          (InterstitialAd ad) => log('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        log('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        log('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }
}
