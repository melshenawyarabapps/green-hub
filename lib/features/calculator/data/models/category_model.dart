import 'package:equatable/equatable.dart';
import 'package:gold/generated/assets.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String icon;
  final String price;

  const CategoryModel({
    required this.id,
    required this.name,
    this.icon = Assets.testDemo,
    this.price = '00.0',
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
      price: json['price'] as String? ?? '00.0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    icon,
    price,
  ];
}