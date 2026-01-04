import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/default_page_layout.dart';
import 'package:greenhub/features/orders/data/enums/order_states_enum.dart';
import 'package:greenhub/features/orders/data/enums/orders_list_enum.dart';
import 'package:greenhub/features/orders/presentation/cubits/order_list_cubit/order_list_cubit.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/orders_list_widgets/order_list_item_widget/order_list_item_widget.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/orders_list_widgets/order_list_tap_bar.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderListCubit(),
      child: Builder(
          builder: (context) {
            return DefaultPageLayout(
              showBackButton: false,
              title: LocaleKeys.myOrders.tr(),
              child: Column(
                children: [
                  20.verticalSpace,
                  const OrderListTapBar(),
                  4.verticalSpace,
                  BlocBuilder<OrderListCubit, OrderListState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.only(
                            top: 16.h,
                            bottom: 120.h,
                          ),
                          itemBuilder:
                              (context, index) =>
                              OrderListItemWidget(
                                currentListType: state.selectedListType,
                                orderState: OrderStatesEnum.values[index %
                                    OrderStatesEnum.values.length],
                              ),
                          separatorBuilder: (context, index) =>
                          20.verticalSpace,
                          itemCount: 10,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
