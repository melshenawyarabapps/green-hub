import 'package:easy_localization/easy_localization.dart';
import 'package:gold/core/utils/app_constants.dart';
import 'package:gold/translations/locale_keys.g.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(
  String url, {
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  try {
    await launchUrl(Uri.parse(url), mode: mode);
  } catch (_) {}
}

Future<void> shareApp() async {
  try {
    await SharePlus.instance.share(
      ShareParams(
        text:
            '${LocaleKeys.checkOut.tr()}\nGoogle Play : ${AppConstants.instance.androidStoreUrl}\nApp Store : ${AppConstants.instance.iosStoreUrl}',
      ),
    );
  } catch (_) {}
}
