import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gold/core/models/more_model.dart';
import 'package:gold/core/utils/functions.dart';
import 'package:gold/translations/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstants {
  AppConstants._();

  static AppConstants? _instance;

  static AppConstants get instance => _instance ??= AppConstants._();

  final String appVersion = '1.0.0';

  String get storeUrl =>
      Platform.isIOS
          ? ''
          : 'https://play.google.com/store/apps/details?id=com.saudi.goldprice.sa';

  String get privacyPolicyUrl =>
      'https://saudigoldpricenow.com/privacy-policy/';

  String get disclaimerUrl => 'https://saudigoldpricenow.com/إخلاء-مسؤولية/';

  final List<MoreModel> moreItems = [
    MoreModel(
      title: LocaleKeys.notifications.tr(),
      icon: Icons.notifications_outlined,
      onPressed: () {},
    ),
    MoreModel(
      title: LocaleKeys.rateApp.tr(),
      icon: Icons.star_border,
      onPressed: () {
        openUrl(
          AppConstants.instance.storeUrl,
          mode: LaunchMode.externalApplication,
        );
      },
    ),
    MoreModel(
      title: LocaleKeys.privacyPolicy.tr(),
      icon: Icons.star_border,
      onPressed: () {
        openUrl(AppConstants.instance.privacyPolicyUrl);
      },
    ),
    MoreModel(
      title: LocaleKeys.disclaimer.tr(),
      icon: Icons.star_border,
      onPressed: () {
        openUrl(AppConstants.instance.disclaimerUrl);
      },
    ),
    MoreModel(
      title: LocaleKeys.shareApp.tr(),
      icon: Icons.star_border,
      onPressed: () {
        shareApp();
      },
    ),
    MoreModel(
      title: LocaleKeys.contactUs.tr(),
      icon: Icons.star_border,
      onPressed: () {},
    ),
  ];
}
