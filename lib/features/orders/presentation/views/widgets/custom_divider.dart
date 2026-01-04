import 'package:flutter/material.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.verticalPadding = 28, this.dividerColor = const Color(0xffE1E9EF)});

  final double verticalPadding;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hvPadding(
        vertical: verticalPadding,
      ),
      child: Divider(
        height: 0.5,
        color: dividerColor,
      ),
    );
  }
}
