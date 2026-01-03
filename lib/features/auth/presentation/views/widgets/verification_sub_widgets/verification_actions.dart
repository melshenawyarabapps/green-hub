import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/features/auth/presentation/cubit/auth_cubit.dart';

class VerificationActions extends StatelessWidget {
  const VerificationActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Column(
      children: [
        32.verticalSpace,
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return AppElevatedButton(
              title: LocaleKeys.loginAction.tr(),
              isLoading: state.isLoading,
              onPressed: state.isLoading ? null : () => cubit.verifyOtp(),
            );
          },
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextButton.black(
              title: LocaleKeys.returnToLogin.tr(),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
