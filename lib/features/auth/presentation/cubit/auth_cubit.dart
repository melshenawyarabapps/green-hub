import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/core/errors/app_exceptions.dart';
import 'package:greenhub/core/services/storage/secure_storage_service.dart';
import 'package:greenhub/features/auth/data/models/register_request.dart';
import 'package:greenhub/features/auth/data/repos/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final SecureStorageService _secureStorageService;

  AuthCubit(this._authRepository, this._secureStorageService) : super(const AuthState());

  // Controllers for login
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Controllers for registration
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController licenseExpiryController = TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  // OTP Controller
  final TextEditingController otpController = TextEditingController();

  // Face image for registration
  String? faceImageBase64;

  void setAuthFlow(AuthFlow flow, {required bool isUser}) {
    emit(state.copyWith(flow: flow, isUser: isUser, status: AuthStatus.initial));
  }

  void setPhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void toggleTerms(bool? value) {
    emit(state.copyWith(agreeTerms: value ?? !state.agreeTerms));
  }

  void setFaceImage(String? base64Image) {
    faceImageBase64 = base64Image;
  }

  String get formattedPhone {
    final phone = phoneController.text.trim();
    if (phone.startsWith('0')) {
      return '+966${phone.substring(1)}';
    } else if (!phone.startsWith('+')) {
      return '+966$phone';
    }
    return phone;
  }

  Future<void> sendOtp() async {
    final formKey = state.flow == AuthFlow.login ? loginFormKey : registerFormKey;
    if (formKey.currentState?.validate() != true) return;

    emit(state.copyWith(status: AuthStatus.loading, phone: formattedPhone));

    try {
      if (state.isUser) {
        // Customer app - single endpoint for both login and register
        await _authRepository.customerSendOtp(phone: formattedPhone);
      } else {
        // Driver app - separate endpoints for login and register
        if (state.flow == AuthFlow.login) {
          await _authRepository.driverSendLoginOtp(phone: formattedPhone);
        } else {
          await _authRepository.driverSendRegisterOtp(phone: formattedPhone);
        }
      }
      emit(state.copyWith(
        status: AuthStatus.success,
        isOtpSent: true,
      ));
    } on ServerException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.fallbackMessage ?? e.localeKey,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> resendOtp() async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      if (state.isUser) {
        // Customer app - single endpoint
        await _authRepository.customerSendOtp(phone: state.phone!);
      } else {
        // Driver app - separate endpoints
        if (state.flow == AuthFlow.login) {
          await _authRepository.driverSendLoginOtp(phone: state.phone!);
        } else {
          await _authRepository.driverSendRegisterOtp(phone: state.phone!);
        }
      }
      emit(state.copyWith(status: AuthStatus.success));
    } on ServerException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.fallbackMessage ?? e.localeKey,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> verifyOtp() async {
    final otp = otpController.text.trim();
    if (otp.length != 6) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'invalidOtp',
      ));
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading, otp: otp));

    try {
      final response = state.isUser
          ? await _authRepository.customerVerifyOtp(phone: state.phone!, otp: otp)
          : await _authRepository.driverVerifyOtp(phone: state.phone!, otp: otp);

      // Save token and user data if available
      if (response.token != null) {
        await _secureStorageService.saveToken(response.token!);
      }
      if (response.user != null) {
        await _secureStorageService.saveUserData(
          id: response.user!.id ?? 0,
          name: response.user!.name ?? '',
          phone: response.user!.phone ?? state.phone!,
          email: response.user!.email,
          avatar: response.user!.avatar,
        );
      }

      if (state.flow == AuthFlow.login) {
        // For login, verification success means we're done
        emit(state.copyWith(
          status: AuthStatus.success,
          isOtpVerified: true,
          token: response.token,
        ));
      } else {
        // For register, we need to proceed with registration
        emit(state.copyWith(
          status: AuthStatus.success,
          isOtpVerified: true,
        ));
      }
    } on ServerException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.fallbackMessage ?? e.localeKey,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> register() async {
    if (registerFormKey.currentState?.validate() != true) return;

    if (!state.agreeTerms) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'agreeTermsRequired',
      ));
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading));

    try {
      final request = RegisterRequest(
        phone: state.phone!,
        otp: state.otp!,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        nationalId: nationalIdController.text.trim(),
        licenseNumber: licenseNumberController.text.trim(),
        licenseExpiry: licenseExpiryController.text.trim(),
        faceImage: faceImageBase64,
      );

      final response = await _authRepository.driverRegister(request: request);

      // Save token and user data if available
      if (response.token != null) {
        await _secureStorageService.saveToken(response.token!);
      }
      if (response.user != null) {
        await _secureStorageService.saveUserData(
          id: response.user!.id ?? 0,
          name: response.user!.name ?? nameController.text.trim(),
          phone: response.user!.phone ?? state.phone!,
          email: response.user!.email ?? emailController.text.trim(),
          avatar: response.user!.avatar,
        );
      }

      emit(state.copyWith(
        status: AuthStatus.success,
        token: response.token,
      ));
    } on ServerException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.fallbackMessage ?? e.localeKey,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void resetState() {
    emit(const AuthState());
  }

  void resetError() {
    emit(state.copyWith(status: AuthStatus.initial));
  }

  Future<void> logout({required bool isUser}) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      // Call logout API
      if (isUser) {
        await _authRepository.customerLogout();
      } else {
        await _authRepository.driverLogout();
      }

      // Clear local storage
      await _secureStorageService.clearAll();
      emit(const AuthState());
    } on ServerException catch (e) {
      // Even if API fails, clear local storage and logout
      await _secureStorageService.clearAll();
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: e.fallbackMessage ?? e.localeKey,
      ));
    } catch (e) {
      // Even if API fails, clear local storage and logout
      await _secureStorageService.clearAll();
      emit(const AuthState());
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    nameController.dispose();
    emailController.dispose();
    nationalIdController.dispose();
    licenseNumberController.dispose();
    licenseExpiryController.dispose();
    otpController.dispose();
    return super.close();
  }
}

