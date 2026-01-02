import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/default_page_layout.dart';
import 'package:greenhub/features/addresses/data/models/address_model.dart';
import 'package:greenhub/features/addresses/presentation/views/widgets/address_item_widget.dart';

import '../../../../generated/assets.dart';

class EditAddressView extends StatelessWidget {
  const EditAddressView({super.key, required this.model});

  final AddressModel model;

  @override
  Widget build(BuildContext context) {
    return DefaultPageLayout(
      title: LocaleKeys.editAddress.tr(),
      bottomSheet: Padding(
        padding: AppPadding.all(20),
        child: AppElevatedButton(title: LocaleKeys.save.tr()),
      ),
      child: Padding(
        padding: AppPadding.verticalPadding(12),
        child: ListView(
          padding: AppPadding.hvPadding(
            vertical: 20,
          ),
          children: [
            AddressItemWidget(
              model: model,
              hasDelete: true,
            ),
            12.verticalSpace,
            AppTextFormField(
              hintText: LocaleKeys.searchForAddress.tr(),
              prefixIcon: Padding(
                padding: AppPadding.onlyPadding(top: 20, bottom: 20, start: 12),
                child: SvgPicture.asset(
                  Assets.svgsSearch,
                  width: 14.w,
                  height: 14.h,
                ),
              ),
            ),
            12.verticalSpace,
            Row(
              spacing: 8.w,
              children: [
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.governorateName.tr(),
                  ),
                ),
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.cityName.tr(),
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              spacing: 8.w,
              children: [
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.districtName.tr(),
                  ),
                ),
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.streetName.tr(),
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              spacing: 8.w,
              children: [
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.buildingNumber.tr(),
                  ),
                ),
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.floorNumber.tr(),
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            AppTextFormField(
              hintText: LocaleKeys.nearLandMark.tr(),
              minLines: 3,
              maxLines: 3,
              radius: 12,
            ),
          ],
        ),
      ),
    );
  }
}
