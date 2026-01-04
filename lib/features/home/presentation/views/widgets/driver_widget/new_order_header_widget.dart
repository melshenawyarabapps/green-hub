import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/features/home/presentation/views/widgets/package_icon_widget.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/available_vehicles_widgets/custom_vechile_size_widget.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/orders_list_widgets/order_list_item_widget/order_number_widget.dart';

import '../../../../../../generated/assets.dart';

class NewOrderHeaderWidget extends StatelessWidget {
  const NewOrderHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PackageIconWidget(),
        8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderNumberWidget(),
              8.verticalSpace,
              const FittedBox(
                child: CustomVechileSizeWidget(
                  size: 'حجم ثقيل',
                  fontColor: Color(0xffAECF5C),
                  leading: CustomSvgBuilder(
                    path: Assets.svgsDeliveryTruck,
                    width: 14,
                    height: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        8.horizontalSpace,
        Icon(
          Icons.arrow_forward_ios,
          size: 16.r,
          color: context.theme.disabledColor,
        ),
      ],
    );
  }
}
