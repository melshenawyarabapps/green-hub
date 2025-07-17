import 'package:equatable/equatable.dart';

class BaseModel extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String basePrice;
  final String dollarPrice;
  final String statusPrice;
  final String changeAmount;

  const BaseModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.basePrice,
    required this.dollarPrice,
    required this.statusPrice,
    required this.changeAmount,
  });

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
