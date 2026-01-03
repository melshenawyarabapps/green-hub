import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/deliveries_list_widget/available_delivery_offer_item_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/deliveries_list_widget/deliveries_list_count_widget.dart';

class DeliveriesListBody extends StatelessWidget {
  const DeliveriesListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DeliveriesListCountWidget(
          count: 5,
        ),
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
          ),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const AvailableDeliveryOfferItemWidget(),
            12.verticalSpace,
            const AvailableDeliveryOfferItemWidget(),
            12.verticalSpace,
            const AvailableDeliveryOfferItemWidget(),
          ],
        ),
      ],
    );
  }
}
