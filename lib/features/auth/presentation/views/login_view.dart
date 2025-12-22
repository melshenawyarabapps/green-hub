import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/country_widget.dart';
import 'package:greenhub/features/auth/presentation/cubit/login_cubit.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/login_texts_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {},
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset(Assets.svgsWhiteLogo)],
                ),
              ),
            ),
            PositionedDirectional(
              bottom: context.bottomPadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (!AppConfig.instance.currentFlavor.isUser) ...[
                      const LoginTextsWidget(),
                      60.verticalSpace,
                    ],
                    Container(
                      width: 375.w,
                      height: 373.h,
                      padding: AppPadding.onlyPadding(top: AppPadding.p12),
                      decoration: decorations?.borderWhite20Decoration,
                      child: Container(
                        alignment: AlignmentGeometry.center,
                        decoration: decorations?.borderWhiteDecoration,
                        padding: AppPadding.horizontalPadding(AppPadding.p20),
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
                            40.verticalSpace,
                            AppTextFormField(
                              hintText: LocaleKeys.phoneNumber.tr(),
                              prefixIcon: const CountryWidget(),
                              keyboardType: TextInputType.number,
                              maxLength: 9,
                              prefixWidth: 90.w,
                              validator: (value) {
                                final validator = value.validateNumber;
                                if (validator != null) {
                                  return validator.tr();
                                }
                                return null;
                              },
                            ),
                            56.verticalSpace,
                            AppElevatedButton(
                              title: LocaleKeys.loginAction.tr(),
                              onPressed: () {
                                context.pushNamed(AppRoutes.verificationView);
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
