import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/features/before_auth/presentation/cubit/before_auth_cubit.dart';

class BeforeAuthView extends StatelessWidget {
  const BeforeAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<BeforeAuthCubit>(),
      child: BlocListener<BeforeAuthCubit, BeforeAuthState>(
        listener: (context, state) {
          if (state.status == BeforeAuthStatus.navigateToLogin) {
            context.pushNamed(AppRoutes.loginView);
          } else if (state.status == BeforeAuthStatus.navigateToRegister) {
            context.pushNamed(AppRoutes.registerView);
          }
        },
        child: const _BeforeAuthViewBody(),
      ),
    );
  }
}

class _BeforeAuthViewBody extends StatelessWidget {
  const _BeforeAuthViewBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AppGradientWidget()),
          SafeArea(
            child: Image.asset(
              Assets.imagesChooseImage,
              fit: BoxFit.fill,
              width: 375.w,
              height: 800.h,
            ),
          ),
          Image.asset(
            Assets.imagesChooseOut,
            fit: BoxFit.fill,
            width: 375.w,
            height: 510.h,
          ),
          SafeArea(
            child: Padding(
              padding: AppPadding.horizontalPadding(AppPadding.p24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBackButton(),
                  Container(
                    padding: AppPadding.hvPadding(
                      height: AppPadding.p8,
                      width: AppPadding.p12,
                    ),
                    decoration: BoxDecoration(
                      color: decorations?.borderWhite20Decoration.color,
                      borderRadius: AppRadius.all(AppRadius.r8),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.iconsEn,
                          width: 33.w,
                          height: 22.h,
                        ),
                        4.horizontalSpace,
                        Text("EN", style: textTheme.titleSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          PositionedDirectional(
            bottom: 0,
            child: Container(
              width: 375.w,
              height: 341.h,
              padding: AppPadding.onlyPadding(top: AppPadding.p12),
              decoration: decorations?.borderWhite20Decoration,
              child: Container(
                alignment: AlignmentGeometry.center,
                decoration: decorations?.borderWhiteDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(LocaleKeys.newUser.tr(), style: textTheme.bodyMedium),
                    32.verticalSpace,

                    AppElevatedButton(
                      title: LocaleKeys.yesNew.tr(),
                      onPressed: () {
                        context.read<BeforeAuthCubit>().navigateToRegister();
                      },
                    ),
                    16.verticalSpace,
                    AppOutlinedButton(
                      title: LocaleKeys.no.tr(),
                      onPressed: () {
                        context.read<BeforeAuthCubit>().navigateToLogin();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
