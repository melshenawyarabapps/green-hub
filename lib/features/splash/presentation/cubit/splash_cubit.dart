import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/features/boarding/data/repos/boarding_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final BoardingRepository _boardingRepository;

  SplashCubit(this._boardingRepository) : super(const SplashState());

  Future<void> checkBoardingStatus() async {
    emit(state.copyWith(status: SplashStatus.loading));

    await Future.delayed(const Duration(milliseconds: 800));

    final boardingViewed = await _boardingRepository.isBoardingViewed();

    if (boardingViewed) {
      emit(state.copyWith(status: SplashStatus.navigateToAuth));
    } else {
      emit(state.copyWith(status: SplashStatus.navigateToBoarding));
    }
  }
}
