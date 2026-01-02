import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/address_model.dart';
import '../../data/repos/address_repository.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepository _repository;

  AddressCubit(this._repository) : super(const AddressState());

  Future<void> fetchAddresses() async {
    emit(state.copyWith(status: AddressStatus.loading));
    try {
      final addresses = await _repository.fetchAddresses();
      emit(state.copyWith(
        addresses: addresses,
        status: AddressStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AddressStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> addAddress(AddressModel address) async {
    emit(state.copyWith(status: AddressStatus.loading));
    try {
      final newAddress = await _repository.addAddress(address);
      final updatedAddresses = List<AddressModel>.from(state.addresses)
        ..add(newAddress);
      emit(state.copyWith(
        addresses: updatedAddresses,
        status: AddressStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AddressStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> editAddress(AddressModel address) async {
    emit(state.copyWith(status: AddressStatus.loading));
    try {
      final updatedAddress = await _repository.editAddress(address);
      final updatedAddresses = state.addresses.map((a) {
        return a.id == updatedAddress.id ? updatedAddress : a;
      }).toList();
      emit(state.copyWith(
        addresses: updatedAddresses,
        status: AddressStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AddressStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> deleteAddress(int addressId) async {
    emit(state.copyWith(status: AddressStatus.loading));
    try {
      await _repository.deleteAddress(addressId);
      final updatedAddresses = state.addresses
          .where((a) => a.id != addressId)
          .toList();
      emit(state.copyWith(
        addresses: updatedAddresses,
        status: AddressStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AddressStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}

