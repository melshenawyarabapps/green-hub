import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';

class BoardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onSkipPressed;

  const BoardingIndicator({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
            totalPages,
            (i) => Padding(
              padding: EdgeInsets.only(right: i < totalPages - 1 ? 6.w : 0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 8.h,
                width: 90.w,
                decoration:
                    i == currentIndex
                        ? decorations?.circleWhiteDecoration
                        : decorations?.circleWhite20Decoration,
              ),
            ),
          ),
          SizedBox(width: 6.w),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.8, end: 1.0),
            duration: const Duration(milliseconds: 300),
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: InkWell(
              onTap: onSkipPressed,
              borderRadius: BorderRadius.circular(16.r),
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: SvgPicture.asset(
                  Assets.svgsSkip,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
