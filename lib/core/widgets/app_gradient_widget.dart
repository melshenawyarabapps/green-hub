import 'package:flutter/material.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';


class AppGradientWidget extends StatelessWidget {
  const AppGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              Theme.of(
                context,
              ).extension<AppDecorations>()?.mainDecoration.gradient?.colors ??
              [],
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
      ),
    );
  }
}
