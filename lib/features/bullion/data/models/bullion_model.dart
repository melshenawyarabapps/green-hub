import 'package:equatable/equatable.dart';
import 'package:gold/features/base/data/models/base_model.dart';

/*
{
            "id": 1,
            "name": "1 Gram Bar",
            "base_price": "400.32",
            "dollar_price": "106.9122",

        }
 */
class BullionModel extends Equatable {
  final int id;
  final String name;
  final String dollarPrice;
  final String basePrice;

  const BullionModel({
    required this.id,
    required this.name,
    required this.dollarPrice,
    required this.basePrice,
  });

  factory BullionModel.fromJson(Map json) => BullionModel(
    id: json['id'],
    name: json['name'],
    dollarPrice: json['dollar_price'],
    basePrice: json['base_price'],
  );

  @override
  List<Object?> get props => [id, name, basePrice, dollarPrice];
}

extension BullionModelExtension on BullionModel {
  BaseModel get toModel => BaseModel(
    id: id,
    name: name,
    icon: '',
    basePrice: basePrice,
    dollarPrice: dollarPrice,
    statusPrice: '',
    changeAmount: '',
  );
}
