import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';

class OrderNumberWidget extends StatelessWidget {
  const OrderNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${LocaleKeys.orderNumber.tr()}: ',
          style: context.textTheme.labelSmall?.copyWith(
            color: AppLightColors.greyColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '#SH1234',
          style: context.primaryTextTheme.titleMedium?.copyWith(
            color: AppLightColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
