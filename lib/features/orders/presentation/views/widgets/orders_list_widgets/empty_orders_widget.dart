import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/empty_list_widget.dart';

import '../../../../../../generated/assets.dart';

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 70.h),
      child: EmptyListWidget(
        imagePath: Assets.imagesEmptyOrdersImg,
        title: LocaleKeys.noOrders.tr(),
        subTitle: LocaleKeys.youHaveNoOrders.tr(),
      ),
    );
  }
}
