import 'package:flutter/material.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class HomeTitlesWidget extends StatelessWidget {
  const HomeTitlesWidget({super.key, required this.title, this.actionWidget});

  final String title;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontalPadding(20),
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.headlineSmall,
          ),
          const Spacer(),
          if (actionWidget != null) actionWidget!,
        ],
      ),
    );
  }
}
