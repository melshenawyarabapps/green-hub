import 'package:greenhub/core/translations/locale_keys.g.dart';

extension StringExtensions on String? {
  String? get validateText {
    if (this == null || this!.isEmpty) {
      return LocaleKeys.fieldRequired;
    }
    return null;
  }

  String? get validateNumber {
    if (validateText != null) {
      return validateText;
    }

    if (!this!.startsWith('5') || this!.length < 9) {
      return LocaleKeys.mustBeNumber;
    }

    return null;
  }
}
