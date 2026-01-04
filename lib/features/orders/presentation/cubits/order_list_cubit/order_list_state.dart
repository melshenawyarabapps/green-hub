part of 'order_list_cubit.dart';

class OrderListState extends Equatable {
  final List<OrdersListEnum> currentListTypes;
  final OrdersListEnum selectedListType;

  const OrderListState({
    this.currentListTypes = const [
      OrdersListEnum.precedent,
      OrdersListEnum.transferInProgress,
      OrdersListEnum.scheduled,
    ],
    this.selectedListType = OrdersListEnum.precedent,
  });

  OrderListState copyWith({
    OrdersListEnum? selectedListType,
  }) {
    return OrderListState(
      currentListTypes: currentListTypes,
      selectedListType: selectedListType ?? this.selectedListType,
    );
  }

  @override
  List<Object?> get props => [
    currentListTypes,
    selectedListType,
  ];
}
