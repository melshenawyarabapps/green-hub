import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/utils/show_bottom_sheet_manager.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:greenhub/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/register_form_container.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/verification_sub_widgets/change_phone_section.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/verification_sub_widgets/pin_input_field.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/verification_sub_widgets/resend_code_section.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/verification_sub_widgets/verification_actions.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/verification_sub_widgets/verification_header.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/verification_sub_widgets/verification_title.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isFailure && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
        if (state.isSuccess && state.isOtpVerified) {
          _handleVerificationSuccess(context, state);
        }
      },
      child: const _VerificationViewBody(),
    );
  }

  void _handleVerificationSuccess(BuildContext context, AuthState state) {
    final isUser = context.isUser;
    final isLogin = state.flow == AuthFlow.login;

    if (isLogin) {
      // Login flow - show success and navigate to home/faceId
      ShowBottomSheetManager.showSuccess(
        context,
        title: LocaleKeys.loginSuccessfully.tr(),
        enableDrag: true,
      ).whenComplete(() {
        if (isUser) {
          context.pushNamedAndRemoveUntil(AppRoutes.navigationView);
        } else {
          context.pushReplacementNamed(AppRoutes.faceIdView);
        }
      });
    } else {
      // Register flow - proceed to complete registration
      if (isUser) {
        // For user, complete registration directly
        context.read<AuthCubit>().register();
      } else {
        // For delivery, show success and navigate
        SuccessBottomSheet.show(
          context,
          title: LocaleKeys.registerSuccessfully.tr(),
          subTitle: LocaleKeys.registerSuccessfullyDescription.tr(),
        ).then((_) {
          context.pushNamedAndRemoveUntil(AppRoutes.navigationView);
        });
      }
    }
  }
}

class _VerificationViewBody extends StatelessWidget {
  const _VerificationViewBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          alignment: AlignmentGeometry.topCenter,
          children: [
            const Positioned.fill(child: AppGradientWidget()),
            const VerificationHeader(),
            RegisterFormContainer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerificationTitle(),
                    ResendCodeSection(
                      onResend: () => cubit.resendOtp(),
                    ),
                    16.verticalSpace,
                    PinInputField(
                      controller: cubit.otpController,
                      onCompleted: (_) => cubit.verifyOtp(),
                    ),
                    const ChangePhoneSection(),
                    const VerificationActions(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
