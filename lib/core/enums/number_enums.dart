import 'dart:ui';

import 'package:gold/core/config/app_config.dart';

enum NumberType { ac, c, delete, number, equal }

extension NumberTypeExtension on NumberType {
  bool get isAC => this == NumberType.ac;

  bool get isC => this == NumberType.c;

  bool get isDelete => this == NumberType.delete;

  bool get isNumber => this == NumberType.number;

  bool get isEqual => this == NumberType.equal;

  Color get color {
    switch (this) {
      case NumberType.ac:
        return AppConfig.instance.darkColors!.redColor1;
      case NumberType.c:
        return AppConfig.instance.darkColors!.secondaryColor;
      case NumberType.delete:
        return AppConfig.instance.darkColors!.secondaryColor;
      case NumberType.number:
        return AppConfig.instance.darkColors!.secondaryColor;
      case NumberType.equal:
        return AppConfig.instance.darkColors!.greenColor1;


    }
  }

}
