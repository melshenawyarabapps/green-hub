import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/features/orders/data/enums/orders_list_enum.dart';
import 'package:greenhub/features/orders/presentation/cubits/order_list_cubit/order_list_cubit.dart';

class OrderListTapBar extends StatefulWidget {
  const OrderListTapBar({super.key});

  @override
  State<OrderListTapBar> createState() => _OrderListTapBarState();
}

class _OrderListTapBarState extends State<OrderListTapBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(250),
        border: Border.all(
          color: AppLightColors.greyColor2,
        ),
      ),
      child: BlocBuilder<OrderListCubit, OrderListState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                state.currentListTypes
                    .map(
                      (order) => Expanded(
                        child: GestureDetector(
                          onTap: () => context.read<OrderListCubit>().changeSelectedListType(order),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: double.infinity,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:
                                  state.selectedListType == order
                                      ? AppLightColors.primaryColor.withValues(
                                        alpha: 0.1,
                                      )
                                      : AppLightColors.transparent,
                              borderRadius: BorderRadius.circular(250),
                            ),
                            child: Text(
                              order.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color:
                                    state.selectedListType == order
                                        ? AppLightColors.primaryColor
                                        : AppLightColors.greyColor3,
                                fontWeight:
                                    state.selectedListType == order
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          );
        },
      ),
    );
  }
}
