import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/default_page_layout.dart';
import 'package:greenhub/features/addresses/data/models/address_model.dart';

import 'widgets/address_item_widget.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
      title: LocaleKeys.selectYourAddress.tr(),
      child: ListView.separated(
        padding: AppPadding.verticalPadding(20.h),
        itemBuilder: (_, index) {
          return const AddressItemWidget(
            model: AddressModel(
              id: 0,
              addressName: 'منزلي',
              governorateName: ' الرياض',
              cityName: ' الرياض',
              districtName: ' الرياض',
              streetName: 'ش الايمان ',
              buildingNumber: '5',
              floorNumber: '4',
              landMark: 'بجانب مسجد الهدى',
            ),
          );
        },
        separatorBuilder: (_, __) => 12.verticalSpace,
        itemCount: 2,
      ),
    );
  }
}
