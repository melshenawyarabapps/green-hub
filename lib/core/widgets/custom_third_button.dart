import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/utils/app_colors.dart';

class CustomThirdButton extends StatelessWidget {
  const CustomThirdButton({
    super.key,
    required this.title,
    this.onPressed,
    this.fontSize = 14,
    this.color = const Color(0xffCF391E),
  });

  final String title;
  final VoidCallback? onPressed;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      padding: EdgeInsets.zero,
      textColor: AppLightColors.redColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(250.r),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color.withValues(
            alpha: 0.1,
          ),
          borderRadius: BorderRadius.circular(250.r),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
