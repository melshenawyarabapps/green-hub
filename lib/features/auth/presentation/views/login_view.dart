import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/core/widgets/app_phone_text_field.dart';
import 'package:greenhub/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/login_texts_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final isUser = context.isUser;
    return BlocProvider(
      create: (_) => getIt.get<AuthCubit>()..setAuthFlow(AuthFlow.login, isUser: isUser),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isFailure && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
          if (state.isSuccess && state.isOtpSent) {
            context.pushNamed(
              AppRoutes.verificationView,
              arguments: context.read<AuthCubit>(),
            );
          }
        },
        child: const _LoginViewBody(),
      ),
    );
  }
}

class _LoginViewBody extends StatelessWidget {
  const _LoginViewBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: 800.h,
        child: Stack(
          children: [
            const Positioned.fill(child: AppGradientWidget()),
            SafeArea(
              child: Image.asset(
                Assets.imagesLogin,
                fit: BoxFit.fill,
                width: 375.w,
                height: 576.h,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: AppPadding.onlyPadding(top: AppPadding.p56),
                child: Visibility(
                  visible: !isKeyboardOpen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SvgPicture.asset(Assets.svgsWhiteLogo)],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              bottom: context.bottomPadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const LoginTextsWidget(),
                    24.verticalSpace,
                    Container(
                      width: 375.w,
                      height: context.screenHeight / 2.3,
                      padding: AppPadding.onlyPadding(top: AppPadding.p12),
                      decoration: decorations?.borderWhite20Decoration,
                      child: Container(
                        alignment: AlignmentGeometry.center,
                        decoration: decorations?.borderWhiteDecoration,
                        padding: AppPadding.horizontalPadding(AppPadding.p20),
                        child: Form(
                          key: cubit.loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              40.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.loginTitle.tr(),
                                    style: textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              if (context.isUser) 40.verticalSpace else 60.verticalSpace,
                              AppPhoneTextField(
                                controller: cubit.phoneController,
                              ),
                              40.verticalSpace,
                              BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  return AppElevatedButton(
                                    title: LocaleKeys.loginAction.tr(),
                                    isLoading: state.isLoading,
                                    onPressed: state.isLoading ? null : () => cubit.sendOtp(),
                                  );
                                },
                              ),
                              8.verticalSpace,
                              AppTextButton.black(
                                title: LocaleKeys.back.tr(),
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
