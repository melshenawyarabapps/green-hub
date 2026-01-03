import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_phone_text_field.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/custom_drop_down_menu.dart';

class ShipmentDetailsWidget extends StatelessWidget {
  const ShipmentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.shipmentDetails.tr(),
          style: context.textTheme.headlineSmall,
        ),
        4.verticalSpace,
        Row(
          children: [
            _buildTitle(context, LocaleKeys.weight.tr()),
            Text(
              ' (${LocaleKeys.optional.tr()})',
              style: context.textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        AppTextFormField(
          hintText: LocaleKeys.enterShipmentWeight.tr(),
          suffixIcon: SizedBox(
            width: 50.w,
            child: Center(
              child: Text(
                'kg',
                style: context.textTheme.labelMedium!.copyWith(color: Colors.black),
              ),
            ),
          ),
        ),
        _buildTitle(context, LocaleKeys.shipmentType.tr()),
        CustomDropdownWidget<String>(
          items: const [
            'Fragile',
            'Perishable',
            'Oversized',
          ],
          hint: LocaleKeys.selectShipmentType.tr(),
          itemLabelBuilder: (item) => item,
        ),
        _buildTitle(context, LocaleKeys.shipmentReceiverNumber.tr()),
        const AppPhoneTextField(),
        _buildTitle(context, LocaleKeys.vehiclesNumber.tr()),
        AppTextFormField(
          hintText: '1',
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildButton(
                context: context,
                icon: Icons.remove,
                iconColor: AppLightColors.greyColor8,
                backgroundColor: context.theme.scaffoldBackgroundColor,
                onTap: () {
                  // Decrease vehicles number logic
                },
              ),
              8.horizontalSpace,
              _buildButton(
                context: context,
                icon: Icons.add,
                iconColor: context.theme.scaffoldBackgroundColor,
                backgroundColor: context.theme.primaryColor,
                onTap: () {
                  // Increase vehicles number logic
                },
              ),
              12.horizontalSpace,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: icon == Icons.add ? backgroundColor : iconColor,
          ),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 18.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Padding(
      padding: AppPadding.hvPadding(vertical: 12.h),
      child: Text(
        title,
        style: context.primaryTextTheme.displayMedium,
      ),
    );
  }
}
