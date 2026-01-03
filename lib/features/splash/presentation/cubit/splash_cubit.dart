import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/core/services/storage/secure_storage_service.dart';
import 'package:greenhub/features/boarding/data/repos/boarding_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final BoardingRepository _boardingRepository;
  final SecureStorageService _secureStorageService;

  SplashCubit(this._boardingRepository, this._secureStorageService) : super(const SplashState());

  Future<void> checkBoardingStatus() async {
    emit(state.copyWith(status: SplashStatus.loading));

    await Future.delayed(const Duration(milliseconds: 800));

    // First check if user has a token (already logged in)
    final hasToken = await _secureStorageService.hasToken();

    if (hasToken) {
      // User is logged in, navigate to main app
      emit(state.copyWith(status: SplashStatus.navigateToHome));
      return;
    }

    // Check if boarding has been viewed
    final boardingViewed = await _boardingRepository.isBoardingViewed();

    if (boardingViewed) {
      emit(state.copyWith(status: SplashStatus.navigateToAuth));
    } else {
      emit(state.copyWith(status: SplashStatus.navigateToBoarding));
    }
  }
}
