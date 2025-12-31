import 'package:flutter/material.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class AppBarCustomButton extends StatelessWidget {
  const AppBarCustomButton({super.key, this.onPressed, required this.child, this.backgroundColor});

  final Function()? onPressed;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: AppPadding.all(8),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.secondaryContainer,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
