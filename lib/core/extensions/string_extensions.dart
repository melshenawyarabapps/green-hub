import 'package:intl/intl.dart';

extension StringExtensions on String? {
  String get capitalizeFirst =>
      this == null || this!.length < 2
          ? this ?? ''
          : [this!.substring(0, 1).toUpperCase(), this!.substring(1)].join();

  bool get isNetwork => this == null ? false : this!.startsWith('http');

  bool get isAsset => this == null ? false : this!.startsWith('assets');

  num get parsePrice =>
      this == null ? 0 : num.tryParse(this!.replaceAll(',', '.')) ?? 0;

  String get formatNumber {
    if (this == '00.0') {
      return this??'';
    }

    final parsed = num.tryParse(this??'0');
    if (parsed == null) {
      return this??'';
    }

    if (parsed is int || parsed == parsed.roundToDouble()) {
      return NumberFormat('#,##0').format(parsed);
    } else {
      return NumberFormat('#,##0.##').format(parsed);
    }
  }
}
