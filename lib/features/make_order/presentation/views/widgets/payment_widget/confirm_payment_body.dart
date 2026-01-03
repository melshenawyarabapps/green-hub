import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/payment_widget/add_coupon_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/payment_widget/confirmation_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/payment_widget/payment_details_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/payment_widget/payment_wayes_widget.dart';
import '../create_order_widgets/create_order_container.dart';

class ConfirmPaymentBody extends StatelessWidget {
  const ConfirmPaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CreateOrderContainer(
          child: PaymentDetailsWidget(),
        ),
        20.verticalSpace,
        const CreateOrderContainer(
          child: PaymentWayesWidget(),
        ),
        20.verticalSpace,
        const AddCouponWidget(),
        20.verticalSpace,
        const ConfirmationWidget(),
      ],
    );
  }
}
