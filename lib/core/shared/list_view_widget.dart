import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/api_enums.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/shared/list_view_item_widget.dart';
import 'package:gold/core/shared/loading_empty_widget.dart';
import 'package:gold/core/utils/app_padding.dart';
import 'package:gold/features/ads/presentation/views/banner_ad_widget.dart';
import 'package:gold/features/base/presentation/controllers/base_controller.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key, required this.type});

  final CurrencyType type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: ()async{
          context.read<BaseController>().getData(
            type,
          );
        },
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<BaseController, BaseState>(
                builder: (_, state) {
                  final currentStatus =
                      state.status[type] ?? RequestStatus.loading;
                  final currentData = state.data[type] ?? [];
                  return currentData.isNotEmpty
                      ? ListView.separated(
                        padding: AppPadding.instance.verticalPadding(
                          AppPadding.instance.p16,
                        ),
                        itemCount: currentData.length + 1,
                        itemBuilder:
                            (_, index) =>
                                index == 0
                                    ? const BannerAdWidget()
                                    : ListViewItemWidget(
                                      type: type,
                                      model: currentData[index - 1],
                                    ),
                        separatorBuilder: (_, __) => 8.verticalSpace,
                      )
                      : ListView(
                        children: [
                          LoadingEmptyWidget(isLoading: currentStatus.isLoading),
                        ],
                      );
                },
              ),
            ),
            const BannerAdWidget(),
          ],
        ),
      ),
    );
  }
}
