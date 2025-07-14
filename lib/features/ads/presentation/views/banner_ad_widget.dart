

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gold/core/enums/ads_enums.dart' show AdsType, AdsTypeExtension;
import 'package:gold/core/enums/api_enums.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget>
    with AutomaticKeepAliveClientMixin {
  BannerAd? bannerAd;
  RequestStatus bannerAdStatus = RequestStatus.initial;

  void loadBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdsType.banner.adUnitId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          log('BannerAd loaded.');
          bannerAdStatus = RequestStatus.loaded;
          setState(() {});
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log('BannerAd failedToLoad: $error');
          bannerAdStatus = RequestStatus.error;
          bannerAd?.dispose();
          bannerAd = null;
          ad.dispose();
          setState(() {});
        },
      ),
      request: AdRequest(),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadBannerAd();
    });
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    bannerAd = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return bannerAd != null && bannerAdStatus == RequestStatus.loaded
        ? SizedBox(
          height: bannerAd!.size.height.toDouble(),
          width: bannerAd!.size.width.toDouble(),
          child: AdWidget(ad: bannerAd!),
        )
        : SizedBox.shrink();
  }

  @override
  bool get wantKeepAlive => true;
}
