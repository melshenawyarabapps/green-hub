import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold/features/ads/data/repos/ads_repo.dart';
import 'package:gold/features/ads/presentation/controllers/ads_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsController extends Cubit<AdsState> {
  AdsController(this._apiRepo) : super(AdsState());

  final AdsRepo _apiRepo;

  void loadAppOpenAd() {
    _apiRepo.loadAppOpenAd();
  }

  void loadInterstitialAd() {
    _apiRepo.loadInterstitialAd();
  }

  void listenToAppStateChanges() {
    return;
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream.forEach(
      (state) => _onAppStateChanged(state),
    );
  }

  void _onAppStateChanged(AppState appState) {
    log('New AppState state: $appState');
    if (appState == AppState.foreground) {
      loadAppOpenAd();
    }
  }
}
