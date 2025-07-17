part of 'base_controller.dart';

class BaseState extends Equatable {
  final Map<CurrencyType, RequestStatus> status;

  final Map<CurrencyType, List<BaseModel>> data;

  const BaseState({required this.status, required this.data});

  BaseState copyWith({
    Map<CurrencyType, RequestStatus>? status,
    Map<CurrencyType, List<BaseModel>>? data,
  }) {
    return BaseState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [status, data];
}
