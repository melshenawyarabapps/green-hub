import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/features/auth/presentation/cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            // Show Success Dialog or Navigate
            _showSuccessDialog(context);
          } else if (state.status == LoginStatus.failure) {
            _showFailureDialog(context);
          }
        },
        child: const _LoginViewBody(),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => const AlertDialog(
            content: Text("Login Success!"), // Replace with custom dialog later
          ),
    );
  }

  void _showFailureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => const AlertDialog(
            content: Text("Login Failed!"), // Replace with custom dialog later
          ),
    );
  }
}

class _LoginViewBody extends StatelessWidget {
  const _LoginViewBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>();

    return Scaffold(
      body: Stack(
        children: [
          // Header Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 400.h,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      decorations?.mainDecoration.gradient?.colors ??
                      [const Color(0xFF00A67E), const Color(0xFF00A67E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Image behind
                  Positioned(
                    bottom: 0,
                    child: Image.asset(
                      Assets.imagesChooseImage,
                      height: 350.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Logo
                  Positioned(
                    top: 60.h,
                    child: Image.asset(
                      Assets.iconsLogo,
                      width: 60.w,
                      height: 60.h,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400.h,
              width: double.infinity,
              padding: AppPadding.horizontalPadding(AppPadding.p24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppRadius.vertical(AppRadius.r30),
              ),
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  final cubit = context.read<LoginCubit>();
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        32.verticalSpace,
                        Center(
                          child: Text(
                            LocaleKeys.loginTitle.tr(),
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        32.verticalSpace,

                        // Phone Input
                        AppTextFormField(
                          controller: cubit.phoneController,
                          hintText: LocaleKeys.phoneNumber.tr(),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          // Prefix +966 pill
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Container(
                              width: 80.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "+966",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  4.horizontalSpace,
                                  Image.asset(
                                    'assets/icons/saudi_flag.png', // Fallback or need asset
                                    width: 16.w,
                                    errorBuilder:
                                        (_, __, ___) =>
                                            const Icon(Icons.flag, size: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        32.verticalSpace,

                        SizedBox(
                          width: double.infinity,
                          height: 56.h,
                          child:
                              state.status == LoginStatus.loading
                                  ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                  : AppElevatedButton(
                                    title: LocaleKeys.loginAction.tr(),
                                    onPressed: () {
                                      cubit.login();
                                    },
                                  ),
                        ),

                        16.verticalSpace,
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              LocaleKeys.back.tr(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
