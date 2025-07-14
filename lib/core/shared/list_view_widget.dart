import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/shared/list_view_item_widget.dart';
import 'package:gold/core/utils/app_padding.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.type});
  final CurrencyType type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: AppPadding.instance.verticalPadding(AppPadding.instance.p16),
        itemCount: 10,
        itemBuilder: (_, index) => ListViewItemWidget(type: type,),
        separatorBuilder: (_, __) => 8.verticalSpace,
      ),
    );
  }
}
