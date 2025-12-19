import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/features/boarding/data/repos/boarding_repository.dart';

part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  final BoardingRepository _boardingRepository;

  BoardingCubit(this._boardingRepository) : super(const BoardingState());

  void onPageChanged(int index) {
    emit(state.copyWith(currentIndex: index, animateToPage: false));
  }

  Future<void> completeBoardingAndNavigate() async {
    await _boardingRepository.setBoardingViewed();
    emit(state.copyWith(status: BoardingStatus.navigateToBeforeAuth));
  }

  void nextPage() {
    if (state.currentIndex == 2) {
      completeBoardingAndNavigate();
    } else {
      emit(
        state.copyWith(
          currentIndex: state.currentIndex + 1,
          animateToPage: true,
        ),
      );
    }
  }

  void resetAnimateToPage() {
    emit(state.copyWith(animateToPage: false));
  }
}
