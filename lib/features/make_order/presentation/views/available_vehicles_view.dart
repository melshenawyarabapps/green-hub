import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/default_page_layout.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/available_vehicles_widgets/available_vehicle_item_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/available_vehicles_widgets/delivery_info_widget.dart';

import '../../../../generated/assets.dart';

class AvailableVehiclesView extends StatelessWidget {
  const AvailableVehiclesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
      title: LocaleKeys.availableVehicles.tr(),
      child: ListView(
        padding: AppPadding.onlyPadding(top: 80.h, bottom: 32.h),
        children: [
          const DeliveryInfoWidget(),
          42.verticalSpace,
          const AvailableVehicleItemWidget(
            title: 'شاحنة',
            size: 'حجم ثقيل',
            imagePath: Assets.imagesDeliveryTruck,
            backgroundColor: Color(0xffF4FEEE),
          ),
          8.verticalSpace,
          const AvailableVehicleItemWidget(
            title: 'سيارة',
            size: 'حجم متوسط',
            imagePath: Assets.imagesDeliveryCar,
            backgroundColor: Color(0xffEEF6F5),
          ),

          const AvailableVehicleItemWidget(
            title: 'دباب',
            size: 'حجم خفيف',
            imagePath: Assets.imagesDeliveryScooter,
            backgroundColor: Color(0xffF9EBEF),
          ),
        ],
      ),
    );
  }
}
