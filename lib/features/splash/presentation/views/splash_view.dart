import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/features/splash/presentation/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<SplashCubit>()..checkBoardingStatus(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.status == SplashStatus.navigateToBeforeAuth) {
            context.pushNamed(AppRoutes.beforeAuthView);
          } else if (state.status == SplashStatus.navigateToBoarding) {
            context.pushReplacementNamed(AppRoutes.onBoardingView);
          }
        },
        child: Scaffold(
          body: Container(
            alignment: AlignmentGeometry.center,
            decoration:
                Theme.of(context).extension<AppDecorations>()?.mainDecoration,
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Image.asset(Assets.iconsLogo, height: 172.h, width: 172.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    290.verticalSpace,
                    SvgPicture.asset(Assets.svgsSplash),
                  ],
                ),
                Column(
                  children: [
                    310.verticalSpace,
                    SvgPicture.asset(Assets.svgsSplash1),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
