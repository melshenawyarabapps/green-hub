extension StringExtensions on String? {
  String get capitalizeFirst =>
      this == null || this!.length < 2
          ? this??''
          : [this!.substring(0, 1).toUpperCase(), this!.substring(1)].join();
}
