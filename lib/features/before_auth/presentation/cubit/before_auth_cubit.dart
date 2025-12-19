import 'package:flutter_bloc/flutter_bloc.dart';

part 'before_auth_state.dart';

class BeforeAuthCubit extends Cubit<BeforeAuthState> {
  BeforeAuthCubit() : super(const BeforeAuthState());

  void navigateToLogin() {
    emit(state.copyWith(status: BeforeAuthStatus.navigateToLogin));
  }

  void navigateToRegister() {
    emit(state.copyWith(status: BeforeAuthStatus.navigateToRegister));
  }
}
