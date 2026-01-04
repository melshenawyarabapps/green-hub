import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:greenhub/features/orders/data/enums/orders_list_enum.dart';

part 'order_list_state.dart';

class OrderListCubit extends Cubit<OrderListState> {
  OrderListCubit() : super(const OrderListState());

  void changeSelectedListType(OrdersListEnum selectedListType) {
    if (state.selectedListType == selectedListType) return;
    emit(
      state.copyWith(
        selectedListType: selectedListType,
      ),
    );
  }
}
