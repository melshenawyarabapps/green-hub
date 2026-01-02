import '../models/address_model.dart';

class AddressRepository {
  // Mock data storage (in real app, this would be API calls)
  final List<AddressModel> _addresses = [
    const AddressModel(
      id: 1,
      addressName: 'منزلي',
      governorateName: 'الرياض',
      cityName: 'الرياض',
      districtName: 'الرياض',
      streetName: 'ش الايمان',
      buildingNumber: '5',
      floorNumber: '4',
      landMark: 'بجانب مسجد الهدى',
    ),
    const AddressModel(
      id: 2,
      addressName: 'العمل',
      governorateName: 'الرياض',
      cityName: 'الرياض',
      districtName: 'العليا',
      streetName: 'ش الملك فهد',
      buildingNumber: '10',
      floorNumber: '2',
      landMark: 'برج المملكة',
    ),
  ];

  int _nextId = 3;

  Future<List<AddressModel>> fetchAddresses() async {
    // Mock API call
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_addresses);
  }

  Future<AddressModel> addAddress(AddressModel address) async {
    // Mock API call
    await Future.delayed(const Duration(milliseconds: 500));
    final newAddress = AddressModel(
      id: _nextId++,
      addressName: address.addressName,
      governorateName: address.governorateName,
      cityName: address.cityName,
      districtName: address.districtName,
      streetName: address.streetName,
      buildingNumber: address.buildingNumber,
      floorNumber: address.floorNumber,
      landMark: address.landMark,
    );
    _addresses.add(newAddress);
    return newAddress;
  }

  Future<AddressModel> editAddress(AddressModel address) async {
    // Mock API call
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _addresses.indexWhere((a) => a.id == address.id);
    if (index != -1) {
      _addresses[index] = address;
      return address;
    }
    throw Exception('Address not found');
  }

  Future<void> deleteAddress(int addressId) async {
    // Mock API call
    await Future.delayed(const Duration(milliseconds: 500));
    _addresses.removeWhere((a) => a.id == addressId);
  }
}

