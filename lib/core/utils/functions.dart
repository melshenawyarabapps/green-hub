import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(
  String url, {
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  try {
    await launchUrl(Uri.parse(url), mode: mode);
  } catch (_) {}
}

