import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: 800.h,
        child: Stack(
          alignment: AlignmentGeometry.topCenter,
          children: [
            const Positioned.fill(child: AppGradientWidget()),
            const VerificationHeader(),
            Positioned(
              bottom: 0,
              child: RegisterFormContainer(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerificationTitle(),
                      ResendCodeSection(
                        onResend: () {
                          // TODO: Implement resend code logic
                          debugPrint('Resending code...');
                        },
                      ),
                      16.verticalSpace,
                      const PinInputField(),
                      const ChangePhoneSection(),
                      const VerificationActions(),
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

