import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/features/auth/presentation/cubit/auth_cubit.dart';

class RegisterActionButton extends StatelessWidget {
  final bool isUser;

  const RegisterActionButton({
    super.key,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Column(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return AppElevatedButton(
              title: isUser ? LocaleKeys.saveData.tr() : LocaleKeys.next.tr(),
              isLoading: state.isLoading,
              onPressed: state.isLoading ? null : () => cubit.sendOtp(),
            );
          },
        ),
        24.verticalSpace,
      ],
    );
  }
}

