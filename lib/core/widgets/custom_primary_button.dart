import 'package:flutter/material.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({super.key, required this.title, this.onPressed, this.fontSize = 14});

  final String title;
  final VoidCallback? onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(title: title, onPressed: onPressed, textSize: fontSize);
  }
}
