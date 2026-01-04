import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/custom_primary_button.dart';
import 'package:greenhub/core/widgets/custom_secondary_button.dart';
import 'package:greenhub/core/widgets/custom_third_button.dart';
import 'package:greenhub/features/home/presentation/views/widgets/driver_widget/new_order_header_widget.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/create_order_widgets/create_order_container.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/custom_divider.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/orders_list_widgets/order_list_item_widget/order_list_distenation_widget.dart';

class NewOrderItemWidget extends StatelessWidget {
  const NewOrderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: CreateOrderContainer(
        verticalPadding: 12,
        child: Column(
          children: [
            const NewOrderHeaderWidget(),
            CustomDivider(
              verticalPadding: 16,
              dividerColor: AppLightColors.greyColor2,
            ),
            const OrderListDestinationWidget(),
            CustomDivider(
              verticalPadding: 16,
              dividerColor: AppLightColors.greyColor2,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: Row(
                spacing: 4,
                children: [
                  Expanded(
                    child: CustomPrimaryButton(
                      title: LocaleKeys.shipmentDetails.tr(),
                      fontSize: 10,
                    ),
                  ),
                  Expanded(
                    child: CustomThirdButton(
                      title: LocaleKeys.sendAPriceQuote.tr(),
                      fontSize: 10,
                      color: AppLightColors.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: CustomThirdButton(
                      title: LocaleKeys.cancelTheOrder.tr(),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
