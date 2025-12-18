part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState {
  final RegisterStatus status;
  final String? errorMessage;
  final bool agreeTerms;

  const RegisterState({
    this.status = RegisterStatus.initial,
    this.errorMessage,
    this.agreeTerms = false,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
    bool? agreeTerms,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      agreeTerms: agreeTerms ?? this.agreeTerms,
    );
  }
}
