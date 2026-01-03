import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/generated/assets.dart';

class AddCouponWidget extends StatelessWidget {
  const AddCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            hintText: LocaleKeys.discountCoupon.tr(),
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: CustomSvgBuilder(
                path: Assets.svgsCoupon,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        12.horizontalSpace,
        Container(
          padding: AppPadding.hvPadding(
            vertical: 12,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: context.theme.secondaryHeaderColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            LocaleKeys.activation.tr(),
            style: context.primaryTextTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
