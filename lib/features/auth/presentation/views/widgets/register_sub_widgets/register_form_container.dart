import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class RegisterFormContainer extends StatelessWidget {
  final Widget child;
  final double? height;

  const RegisterFormContainer({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    final decorations = context.decorations;
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Positioned(
      bottom: 0,
      child: Container(
        height: height ?? context.screenHeight - context.topPadding - 130.h,
        width: 375.w,
        decoration: decorations.borderWhite20Decoration,
        padding: AppPadding.onlyPadding(top: AppPadding.p12),
        child: Container(
          height: 660.h,
          width: 375.w,
          padding: AppPadding.horizontalPadding(AppPadding.p20),
          decoration: decorations.borderWhiteDecoration,
          margin: AppPadding.onlyPadding(bottom: context.bottomPadding),
          child: child,
        ),
      ),
    );
  }
}
