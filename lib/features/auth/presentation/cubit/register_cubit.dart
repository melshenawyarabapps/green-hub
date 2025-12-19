import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/features/auth/data/repos/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(const RegisterState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void toggleTerms(bool? value) {
    emit(state.copyWith(agreeTerms: value ?? !state.agreeTerms));
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    if (!state.agreeTerms) {
      // Handle terms not accepted (maybe show snackbar or emit error)
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: 'agreeTermsRequired', // Key in locale
        ),
      );
      return;
    }

    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      await _authRepository.register(
        fullName: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
      );
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
