import 'package:flutter/material.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class CustomSecondaryButton extends StatelessWidget {
  const CustomSecondaryButton({super.key, required this.title, this.onPressed, this.fontSize = 14});

  final String title;
  final VoidCallback? onPressed;
  final double fontSize;


  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      title: title,
      color: context.theme.secondaryHeaderColor,
      textColor: AppLightColors.blackColor,
      textSize: fontSize,
    );
  }
}
