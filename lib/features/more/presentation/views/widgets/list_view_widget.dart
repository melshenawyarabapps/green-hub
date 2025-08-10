import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/utils/app_constants.dart';
import 'package:gold/core/utils/app_padding.dart';
import 'package:gold/features/more/presentation/views/widgets/list_view_item_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = AppConstants.instance.moreItems;
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: AppPadding.instance.zero,
      shrinkWrap: true,
      itemBuilder: (_, index) => ListViewItemWidget(model:data[index]),
      separatorBuilder: (_,__)=>24.verticalSpace,
      itemCount: data.length,
    );
  }
}
