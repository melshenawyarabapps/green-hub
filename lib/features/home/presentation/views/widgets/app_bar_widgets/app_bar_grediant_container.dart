import 'package:flutter/material.dart';
import 'package:greenhub/core/utils/app_padding.dart';


class AppBarGradientContainer extends StatelessWidget {
  const AppBarGradientContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: AppPadding.hvPadding(
          horizontal: 8,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xff4B9C86),
              Color(0xff7EB87D),
            ],
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child
    );
  }
}
