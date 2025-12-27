import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/features/auth/presentation/cubit/register_cubit.dart';
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
    return BlocProvider(
      create: (_) => getIt.get<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        child: const _RegisterViewBody(),
      ),
    );
  }
}

class _RegisterViewBody extends HookWidget {
  const _RegisterViewBody();

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);
    final isUser = context.isUser;

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
                        TermsCheckbox(
                          value: isSelected.value,
                          onChanged: (value) {
                            isSelected.value = value ?? false;
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
