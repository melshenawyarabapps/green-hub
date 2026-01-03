import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/notch_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/select_order_type_bottom_sheet_widgets/order_type_widget.dart';
import 'package:greenhub/generated/assets.dart';

class SelectOrderTypeBottomSheet extends StatefulWidget {
  const SelectOrderTypeBottomSheet({super.key});

  @override
  State<SelectOrderTypeBottomSheet> createState() => _SelectOrderTypeBottomSheetState();
}

class _SelectOrderTypeBottomSheetState extends State<SelectOrderTypeBottomSheet> {
  int selectedIndex = 0;

  _changeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Container(
      width: double.infinity,
      decoration: decorations?.borderWhiteDecoration,
      padding: AppPadding.horizontalPadding(AppPadding.p32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const NotchWidget(),
          12.verticalSpace,
          Text(
            LocaleKeys.selectOrderType.tr(),
            style: textTheme.bodyMedium?.copyWith(fontSize: FontSizes.s24),
          ),
          24.verticalSpace,
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: OrderTypeWidget(
                  isSelected: selectedIndex == 0,
                  onTap: () => _changeSelectedIndex(0),
                  imagePath: Assets.imagesMockService1,
                  title: 'طلب فوري',
                  subTitle: 'أسرع طريقة لإرسال شحنتك الآن',
                ),
              ),
              Expanded(
                child: OrderTypeWidget(
                  isSelected: selectedIndex == 1,
                  onTap: () => _changeSelectedIndex(1),
                  imagePath: Assets.imagesMockService2,
                  title: 'طلب بموعَد',
                  subTitle: 'جدول شحنتك لوقت لاحق',
                ),
              ),
            ],
          ),
          24.verticalSpace,
          AppElevatedButton(
            onPressed: () {},
            title: LocaleKeys.next.tr(),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
