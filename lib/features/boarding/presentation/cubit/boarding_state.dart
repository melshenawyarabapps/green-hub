part of 'boarding_cubit.dart';

enum BoardingStatus { initial, navigateToBeforeAuth }

class BoardingState {
  final int currentIndex;
  final BoardingStatus status;
  final bool animateToPage;

  const BoardingState({
    this.currentIndex = 0,
    this.status = BoardingStatus.initial,
    this.animateToPage = false,
  });

  BoardingState copyWith({
    int? currentIndex,
    BoardingStatus? status,
    bool? animateToPage,
  }) {
    return BoardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
      animateToPage: animateToPage ?? this.animateToPage,
    );
  }
}
