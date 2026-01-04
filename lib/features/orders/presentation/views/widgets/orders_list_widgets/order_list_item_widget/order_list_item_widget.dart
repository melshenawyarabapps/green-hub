import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/features/orders/data/enums/order_states_enum.dart';
import 'package:greenhub/features/orders/data/enums/orders_list_enum.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/create_order_widgets/create_order_container.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/custom_divider.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/orders_list_widgets/order_list_item_widget/order_item_information.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/orders_list_widgets/order_list_item_widget/order_list_distenation_widget.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/orders_list_widgets/order_list_item_widget/order_list_item_header.dart';
import 'package:greenhub/generated/assets.dart';

class OrderListItemWidget extends StatelessWidget {
  const OrderListItemWidget({super.key, required this.orderState, required this.currentListType});

  final OrderStatesEnum orderState;
  final OrdersListEnum currentListType;

  @override
  Widget build(BuildContext context) {
    return CreateOrderContainer(
      verticalPadding: 12,
      child: Column(
        children: [
          OrderListItemHeader(
            orderState: orderState,
          ),
          CustomDivider(
            verticalPadding: 16,
            dividerColor: AppLightColors.greyColor2,
          ),
          const OrderListDestinationWidget(),
          CustomDivider(
            verticalPadding: 16,
            dividerColor: AppLightColors.greyColor2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OrderItemInformation(
                iconPath: Assets.svgsClock,
                value: '25',
                leading: Text(
                  LocaleKeys.minutes.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppLightColors.greyColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              OrderItemInformation(
                iconPath: Assets.svgsCoins,
                value: '55',
                leading: CustomSvgBuilder(
                  path: Assets.svgsSaudiRiyalSymbol,
                  color: AppLightColors.greyColor,
                  width: 12,
                  height: 12,
                ),
              ),
              const OrderItemInformation(
                iconPath: Assets.svgsVechileIc,
                value: 'دباب',
              ),
              const OrderItemInformation(
                iconPath: Assets.svgsBox,
                value: 'حجم خفيف',
              ),
            ],
          ),
          16.verticalSpace,
          SizedBox(
            height: 42.h,
            child: _buildFooter(
              currentListType: currentListType,
              context: context,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter({required OrdersListEnum currentListType, required BuildContext context}) {
    switch (currentListType) {
      case OrdersListEnum.precedent:
        return SizedBox(
          height: 42.h,
          child: AppElevatedButton(
            title: LocaleKeys.orderDetails.tr(),
          ),
        );
      case OrdersListEnum.transferInProgress:
        return SizedBox(
          height: 42.h,
          child: Row(
            children: [
              Expanded(
                child: AppElevatedButton(
                  onPressed: () {},
                  title: LocaleKeys.orderDetails.tr(),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: AppElevatedButton(
                  onPressed: () {},
                  color: context.theme.secondaryHeaderColor,
                  textColor: AppLightColors.blackColor,
                  title: LocaleKeys.followTheOrder.tr(),
                ),
              ),
            ],
          ),
        );
      case OrdersListEnum.scheduled:
        return SizedBox(
          height: 42.h,
          child: Row(
            children: [
              Expanded(
                child: AppElevatedButton(
                  onPressed: () {},
                  title: LocaleKeys.orderDetails.tr(),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  textColor: AppLightColors.redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(250.r),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppLightColors.redColor.withValues(
                        alpha: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(250.r),
                    ),
                    child: Text(
                      LocaleKeys.cancelTheOrder.tr(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppLightColors.redColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}
