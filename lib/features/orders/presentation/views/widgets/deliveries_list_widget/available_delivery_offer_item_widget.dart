import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import '../available_vehicles_widgets/delivery_info_widget.dart';

class AvailableDeliveryOfferItemWidget extends StatelessWidget {
  const AvailableDeliveryOfferItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.hvPadding(
        vertical: 20.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.05,
            ),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: AppPadding.horizontalPadding(8.w),
            child: const DeliveryInfoWidget(
              price: '50',
            ),
          ),
          16.verticalSpace,
          Row(
            spacing: 8,
            children: [
              _OfferButton(
                title: LocaleKeys.details.tr(),
                color: context.theme.primaryColor,
                onPressed: () {},
              ),
              _OfferButton(
                title: LocaleKeys.reject.tr(),
                color: AppLightColors.redColor,
                onPressed: () {},
              ),
              _OfferButton(
                title: LocaleKeys.accept.tr(),
                color: context.theme.primaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OfferButton extends StatelessWidget {
  const _OfferButton({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(250.r),
        ),
        child: Container(
          height: 40.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(250.r),
            color: color.withValues(alpha: 0.1),
          ),
          child: Text(
            title,
            style: context.textTheme.bodySmall!.copyWith(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
