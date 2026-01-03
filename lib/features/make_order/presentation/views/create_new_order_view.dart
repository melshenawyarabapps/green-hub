import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/default_page_layout.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/create_new_order_body.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/create_order_stepper_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/deliveries_list_widget/deliveries_list_body.dart';

class CreateNewOrderView extends StatefulWidget {
  const CreateNewOrderView({super.key});

  @override
  State<CreateNewOrderView> createState() => _CreateNewOrderViewState();
}

class _CreateNewOrderViewState extends State<CreateNewOrderView> {
  int currentStep = 1;

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

  @override
  void initState() {
    steps = [
      const CreateNewOrderBody(),
      const DeliveriesListBody(),
      const CreateNewOrderBody(),
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
            AppElevatedButton(title: LocaleKeys.next.tr(), onPressed: _incrementStep),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
