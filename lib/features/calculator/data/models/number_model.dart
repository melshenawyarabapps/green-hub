import 'package:equatable/equatable.dart';
import 'package:gold/core/enums/number_enums.dart';

class NumberModel extends Equatable {
  final String number;
  final String? text;
  final NumberType type;

  const NumberModel({
    required this.number,
    required this.type,
     this.text,
  });

  @override
  List<Object?> get props => [number,  type,text];
}
