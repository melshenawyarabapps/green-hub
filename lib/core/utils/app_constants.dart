import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:gold/core/models/more_model.dart';
import 'package:gold/core/utils/functions.dart';
import 'package:gold/generated/assets.dart';
import 'package:gold/translations/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstants {
  AppConstants._();

  static AppConstants? _instance;

  static AppConstants get instance => _instance ??= AppConstants._();

  final String appVersion = '1.0.1';

  String get androidStoreUrl => 'https://play.google.com/store/apps/details?id=com.saudi.goldprice';

  String get iosStoreUrl => '';

  String get storeUrl => Platform.isAndroid ? androidStoreUrl : iosStoreUrl;

  String get privacyPolicyUrl =>
      'https://saudigoldpricenow.com/privacy-policy/';

  String get disclaimerUrl => 'https://saudigoldpricenow.com/إخلاء-مسؤولية/';

  final List<MoreModel> moreItems = [
    MoreModel(
      title: LocaleKeys.notifications.tr(),
      icon: Assets.iconsIconNotifications,
      onPressed: () {},
    ),
    MoreModel(
      title: LocaleKeys.rateApp.tr(),
      icon: Assets.iconsIconEvaluation,
      onPressed: () {
        openUrl(
          AppConstants.instance.storeUrl,
          mode: LaunchMode.externalApplication,
        );
      },
    ),
    MoreModel(
      title: LocaleKeys.privacyPolicy.tr(),
      icon: Assets.iconsIconPrivacy,
      onPressed: () {
        openUrl(AppConstants.instance.privacyPolicyUrl);
      },
    ),
    MoreModel(
      title: LocaleKeys.disclaimer.tr(),
      icon: Assets.iconsIconResponsibility,
      onPressed: () {
        openUrl(AppConstants.instance.disclaimerUrl);
      },
    ),
    MoreModel(
      title: LocaleKeys.shareApp.tr(),
      icon: Assets.iconsIconSharing,
      onPressed: () {
        shareApp();
      },
    ),
    MoreModel(
      title: LocaleKeys.contactUs.tr(),
      icon: Assets.iconsIconContactus,
      onPressed: () {},
    ),
  ];
}
