
import 'package:equatable/equatable.dart';
import 'package:gold/features/base/data/models/base_model.dart';

class GoldModel extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String basePrice;
  final String dollarPrice;
  final String statusPrice;
  final String changeAmount;

  const GoldModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.basePrice,
    required this.dollarPrice,
    required this.statusPrice,
    required this.changeAmount,
  });

  factory GoldModel.fromJson(Map json) => GoldModel(
    id: json['id'],
    name: json['name'],
    icon: json['icon'],
    basePrice: json['base_price_nonformate'].toString(),
    dollarPrice: json['dollar_price_nonformate'].toString(),
    statusPrice: json['status_price'],
    changeAmount: json['change_amount'],
  );

  @override
  List<Object?> get props => [
    id,
    name,
    icon,
    basePrice,
    dollarPrice,
    statusPrice,
    changeAmount,
  ];
}

extension GoldModelExtension on GoldModel {
  BaseModel get toModel => BaseModel(
    id: id,
    name: name,
    icon: icon,
    basePrice: basePrice,
    dollarPrice: dollarPrice,
    statusPrice: statusPrice,
    changeAmount: changeAmount,
  );
}
