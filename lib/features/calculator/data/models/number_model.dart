import 'package:equatable/equatable.dart';
import 'package:gold/core/enums/number_enums.dart';

class NumberModel extends Equatable {
  final String number;
  final NumberType type;

  const NumberModel({
    required this.number,
    required this.type,
  });

  @override
  List<Object?> get props => [number,  type];
}
