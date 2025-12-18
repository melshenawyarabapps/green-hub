part of 'before_auth_cubit.dart';

enum BeforeAuthStatus { initial, navigateToLogin, navigateToRegister }

class BeforeAuthState {
  final BeforeAuthStatus status;

  const BeforeAuthState({this.status = BeforeAuthStatus.initial});

  BeforeAuthState copyWith({BeforeAuthStatus? status}) {
    return BeforeAuthState(status: status ?? this.status);
  }
}
