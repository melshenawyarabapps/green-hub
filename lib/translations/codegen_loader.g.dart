// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;
import 'package:gold/translations/locale_keys.g.dart';

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    LocaleKeys.copied: "تم النسخ",
    LocaleKeys.networkError: "الرجاء التحقق من اتصالك بالشبكة ومحاولة مرة أخرى",
    LocaleKeys.unexpectedError: "خطأ غير متوقع",
    LocaleKeys.sendTimeOutPleaseTryAgainLater: "يرجى إعادة المحاولة لاحقًا.",
    LocaleKeys.receiveTimeOutPleaseTryAgainLater:
        "يرجى المحاولة مرة أخرى فى وقت لاحق.",
    LocaleKeys.connectionErrorPleaseTryAgainLater:
        "خطأ فى الاتصال، يرجى المحاولة مرة أخرى لاحقًا.",
    LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater:
        "عفوًا، حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا",
    LocaleKeys.oppsYouNeedToUpdateApp: "تحتاج لتحديث التطبيق",
  };

  static const Map<String, dynamic> en = {};

  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en,
  };
}
