part of 'base_controller.dart';

class BaseState extends Equatable {
  final Map<CurrencyType, RequestStatus> status;

  final Map<CurrencyType, List<BaseModel>> data;
  final Map<CurrencyType, String> lastUpdates;

  const BaseState({
    required this.status,
    required this.data,
    this.lastUpdates = const {},
  });

  BaseState copyWith({
    Map<CurrencyType, RequestStatus>? status,
    Map<CurrencyType, List<BaseModel>>? data,
    Map<CurrencyType, String>? lastUpdates,
  }) {
    return BaseState(
      status: status ?? this.status,
      data: data ?? this.data,

      lastUpdates: lastUpdates ?? this.lastUpdates,
    );
  }

  @override
  List<Object?> get props => [status, data];
}
