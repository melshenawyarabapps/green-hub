import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/delivery_form_fields.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/register_action_button.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/register_form_container.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/register_header.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/terms_checkbox.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/user_form_fields.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final isUser = context.isUser;
    return BlocProvider(
      create: (_) => getIt.get<AuthCubit>()..setAuthFlow(AuthFlow.register, isUser: isUser),
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
        child: const _RegisterViewBody(),
      ),
    );
  }
}

class _RegisterViewBody extends StatelessWidget {
  const _RegisterViewBody();

  @override
  Widget build(BuildContext context) {
    final isUser = context.isUser;
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          alignment: AlignmentGeometry.topCenter,
          children: [
            const Positioned.fill(child: AppGradientWidget()),
            RegisterHeader(isUser: isUser),
            RegisterFormContainer(
              height: context.screenHeight - context.topPadding - 130.h,
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isUser) ...[
                        48.verticalSpace,
                        Text(
                          LocaleKeys.createAccount.tr(),
                          style: context.textTheme.bodyMedium,
                        ),
                        32.verticalSpace,
                        const UserFormFields(),
                        24.verticalSpace,
                        BlocBuilder<AuthCubit, AuthState>(
                          buildWhen: (prev, curr) => prev.agreeTerms != curr.agreeTerms,
                          builder: (context, state) {
                            return TermsCheckbox(
                              value: state.agreeTerms,
                              onChanged: (value) => cubit.toggleTerms(value),
                            );
                          },
                        ),
                        120.verticalSpace,
                      ] else ...[
                        12.verticalSpace,
                        const DeliveryFormFields(),
                        32.verticalSpace,
                      ],
                      RegisterActionButton(isUser: isUser),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
