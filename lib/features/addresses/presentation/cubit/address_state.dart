import 'package:equatable/equatable.dart';
import '../../data/models/address_model.dart';

enum AddressStatus { initial, loading, success, failure }

class AddressState extends Equatable {
  final List<AddressModel> addresses;
  final AddressStatus status;
  final String? errorMessage;

  const AddressState({
    this.addresses = const [],
    this.status = AddressStatus.initial,
    this.errorMessage,
  });

  AddressState copyWith({
    List<AddressModel>? addresses,
    AddressStatus? status,
    String? errorMessage,
  }) {
    return AddressState(
      addresses: addresses ?? this.addresses,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [addresses, status, errorMessage];
}

