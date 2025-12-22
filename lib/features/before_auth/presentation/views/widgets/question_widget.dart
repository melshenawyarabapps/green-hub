import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>();

    return PositionedDirectional(
      bottom: 0,
      child: Container(
        width: 375.w,
        height: 341.h,
        padding: AppPadding.onlyPadding(top: AppPadding.p12),
        decoration: decorations?.borderWhite20Decoration,
        child: Container(
          alignment: AlignmentGeometry.center,
          decoration: decorations?.borderWhiteDecoration,
          child: child,
        ),
      ),
    );
  }
}
