import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final int id;
  final String addressName;
  final String governorateName;
  final String cityName;
  final String districtName;
  final String streetName;
  final String buildingNumber;
  final String floorNumber;
  final String landMark;

  const AddressModel({
    required this.id,
    required this.addressName,
    required this.governorateName,
    required this.cityName,
    required this.districtName,
    required this.streetName,
    required this.buildingNumber,
    required this.floorNumber,
    required this.landMark,
  });

  AddressModel copyWith({
    String? addressName,
    String? governorateName,
    String? cityName,
    String? districtName,
    String? streetName,
    String? buildingNumber,
    String? floorNumber,
    String? landMark,
  }) {
    return AddressModel(
      id: id,
      addressName: addressName ?? this.addressName,
      governorateName: governorateName ?? this.governorateName,
      cityName: cityName ?? this.cityName,
      districtName: districtName ?? this.districtName,
      streetName: streetName ?? this.streetName,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      floorNumber: floorNumber ?? this.floorNumber,
      landMark: landMark ?? this.landMark,
    );
  }

  @override
  List<Object?> get props => [
    id,
    addressName,
    governorateName,
    cityName,
    districtName,
    streetName,
    buildingNumber,
    floorNumber,
    landMark,
  ];
}
