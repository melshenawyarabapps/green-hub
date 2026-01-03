import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/show_bottom_sheet_manager.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/deliveries_list_widget/filter_deliveries_bottom_sheet.dart';
import 'package:greenhub/generated/assets.dart';

class DeliveriesListCountWidget extends StatelessWidget {
  const DeliveriesListCountWidget({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LocaleKeys.thereAreANumberOfCarriers.tr(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        4.horizontalSpace,
        CircleAvatar(
          radius: 10,
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          child: Text(
            count.toString(),
            style: context.primaryTextTheme.displaySmall!.copyWith(
              color: AppLightColors.blackColor,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            ShowBottomSheetManager.show(
              isDismissible: false,
              context: context,
              bottomSheet: const FilterDeliveriesBottomSheet(),
            );
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: context.theme.primaryColor.withValues(alpha: 0.1),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSvgBuilder(path: Assets.svgsFilter),
            ),
          ),
        ),
      ],
    );
  }
}
