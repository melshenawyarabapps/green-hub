import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gold/core/enums/ads_enums.dart';
import 'package:gold/core/enums/api_enums.dart';
import 'package:gold/core/extensions/context_extensions.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FluidAdMobileWidget extends StatefulWidget {
  const FluidAdMobileWidget({super.key});

  @override
  State<FluidAdMobileWidget> createState() => _FluidAdMobileWidgetState();
}

class _FluidAdMobileWidgetState extends State<FluidAdMobileWidget>
    with AutomaticKeepAliveClientMixin {
  FluidAdManagerBannerAd? fluidAd;
  RequestStatus fluidAdStatus = RequestStatus.initial;

  void loadFluidAd() {
    fluidAd = FluidAdManagerBannerAd(
      adUnitId: AdsType.fluid.adUnitId,
      request: AdManagerAdRequest(nonPersonalizedAds: true),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (Ad ad) {
          log('FluidAd loaded.');
          fluidAdStatus = RequestStatus.loaded;
          setState(() {});
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          log('FluidAd failedToLoad: $error');
          fluidAdStatus = RequestStatus.error;
          fluidAd?.dispose();
          fluidAd = null;
          ad.dispose();
          setState(() {});
        },
      ),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadFluidAd();
    });
  }

  @override
  void dispose() {
    fluidAd?.dispose();
    fluidAd = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return fluidAd != null && fluidAdStatus == RequestStatus.loaded
        ? FluidAdWidget(width: context.screenWidth, ad: fluidAd!)
        : SizedBox.shrink();
  }

  @override
  bool get wantKeepAlive => true;
}
