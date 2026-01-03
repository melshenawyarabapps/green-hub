part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, success, failure }

enum AuthFlow { login, register }

class AuthState {
  final AuthStatus status;
  final AuthFlow flow;
  final bool isUser; // true for customer app, false for driver app
  final String? phone;
  final String? otp;
  final String? errorMessage;
  final String? token;
  final bool isOtpSent;
  final bool isOtpVerified;
  final bool agreeTerms;

  const AuthState({
    this.status = AuthStatus.initial,
    this.flow = AuthFlow.login,
    this.isUser = true,
    this.phone,
    this.otp,
    this.errorMessage,
    this.token,
    this.isOtpSent = false,
    this.isOtpVerified = false,
    this.agreeTerms = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthFlow? flow,
    bool? isUser,
    String? phone,
    String? otp,
    String? errorMessage,
    String? token,
    bool? isOtpSent,
    bool? isOtpVerified,
    bool? agreeTerms,
  }) {
    return AuthState(
      status: status ?? this.status,
      flow: flow ?? this.flow,
      isUser: isUser ?? this.isUser,
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      errorMessage: errorMessage,
      token: token ?? this.token,
      isOtpSent: isOtpSent ?? this.isOtpSent,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
      agreeTerms: agreeTerms ?? this.agreeTerms,
    );
  }

  bool get isLoading => status == AuthStatus.loading;
  bool get isSuccess => status == AuthStatus.success;
  bool get isFailure => status == AuthStatus.failure;
}

