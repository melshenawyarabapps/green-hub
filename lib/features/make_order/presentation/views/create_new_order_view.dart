import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/default_page_layout.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/create_new_order_body.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/create_order_stepper_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/deliveries_list_widget/deliveries_list_body.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/payment_widget/confirm_payment_body.dart';

class CreateNewOrderView extends StatefulWidget {
  const CreateNewOrderView({super.key});

  @override
  State<CreateNewOrderView> createState() => _CreateNewOrderViewState();
}

class _CreateNewOrderViewState extends State<CreateNewOrderView> {
  int currentStep = 2;

  late List<Widget> steps;

  _incrementStep() {
    if (currentStep != 0) {
      if (currentStep < steps.length - 1) {
        setState(() {
          currentStep++;
        });
      }
      return;
    }
    SuccessBottomSheet.show(
      context,
      enableDrag: true,
      title: LocaleKeys.orderDetailsHaveBeenEnteredSuccessfully.tr(),
      subTitle: LocaleKeys.nowChooseTheDriverThatSuitsYouFromTheAvailableOffers.tr(),
    ).whenComplete(() {
      if (currentStep < steps.length - 1) {
        setState(() {
          currentStep++;
        });
      }
    });
  }

  _decrementStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  _showBottomSheet() {
    SuccessBottomSheet.show(
      context,
      enableDrag: true,
      title: LocaleKeys.paymentSuccessful.tr(),
      subTitle: LocaleKeys.theAmountIsReservedAndWillBeReleasedAfterTheApplicationIsCompleted.tr(),
      footer: Row(
        spacing: 12.w,
        children: [
          Expanded(
            child: AppElevatedButton(
              onPressed: () {},
              title: LocaleKeys.orderDetails.tr(),
              color: context.theme.primaryColor,
            ),
          ),
          Expanded(
            child: AppElevatedButton(
              onPressed: () {},
              title: LocaleKeys.followTheOrder.tr(),
              color: context.theme.secondaryHeaderColor,
              textColor: AppLightColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    steps = [
      const CreateNewOrderBody(),
      const DeliveriesListBody(),
      const ConfirmPaymentBody(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
      title: LocaleKeys.createNewOrder.tr(),
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            CreateOrderStepperWidget(
              currentStep: currentStep,
            ),
            16.verticalSpace,
            steps[currentStep],
            16.verticalSpace,
            AppElevatedButton(
              title: (isLast) ? LocaleKeys.confirmPayment.tr() : LocaleKeys.next.tr(),
              onPressed: (isLast) ? _showBottomSheet : _incrementStep,
            ),
            if (isLast) 12.verticalSpace else 24.verticalSpace,
            if (isLast)
              MaterialButton(
                onPressed: _decrementStep,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44.r),
                  side: BorderSide(
                    color: AppLightColors.redColor,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppLightColors.redColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(44.r),
                  ),
                  child: Text(
                    LocaleKeys.cancelTheOrder.tr(),
                    style: TextStyle(
                      color: AppLightColors.redColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            if (isLast) 24.verticalSpace,
          ],
        ),
      ),
    );
  }

  bool get isLast => currentStep == steps.length - 1;
}
