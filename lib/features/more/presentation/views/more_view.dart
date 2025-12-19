import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';
import 'package:greenhub/features/more/presentation/views/widgets/more_menu_item.dart';
import 'package:greenhub/features/more/presentation/views/widgets/profile_header_widget.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Stack(
      children: [
        Container(
          height: 400.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              colors: decorations?.mainDecoration.gradient?.colors ?? [],
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: AppPadding.verticalPadding(AppPadding.p32),
                child: Text(
                  LocaleKeys.more.tr(),
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: FontSizes.s26,
                    fontWeight: FontWeights.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: decorations?.borderWhite20Decoration,
                  padding: AppPadding.onlyPadding(top: AppPadding.p8),
                  child: Container(
                    width: double.infinity,
                    decoration: decorations?.borderWhiteDecoration,
                    padding: AppPadding.onlyPadding(top: AppPadding.p16),
                    child: SingleChildScrollView(
                      padding: AppPadding.hvPadding(width:AppPadding.p16,),
                      child: Column(
                        children: [

                          const ProfileHeaderWidget(
                            userName: 'مصطفى الجمال',
                            location: 'الدمام، السعودية',
                          ),
                          16.verticalSpace,
                          _buildMenuItems(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    final menuItems = [
      _MenuItemData(
        icon: Assets.svgsEditProfile,
        titleKey: LocaleKeys.editAccountInfo,
        subtitleKey: LocaleKeys.editAccountInfoDesc,
      ),
      _MenuItemData(
        icon: Assets.svgsSvgLogo,
        titleKey: LocaleKeys.aboutApp,
        subtitleKey: LocaleKeys.aboutAppDesc,
      ),
      _MenuItemData(
        icon: Assets.svgsSupport,
        titleKey: LocaleKeys.contactUs,
        subtitleKey: LocaleKeys.contactUsDesc,
      ),
      _MenuItemData(
        icon: Assets.svgsLocations,
        titleKey: LocaleKeys.myAddresses,
        subtitleKey: LocaleKeys.myAddressesDesc,
      ),
      _MenuItemData(
        icon: Assets.svgsWallet,
        titleKey: LocaleKeys.wallet,
        subtitleKey: LocaleKeys.walletDesc,
      ),
      _MenuItemData(
        icon: Assets.svgsSettings,
        titleKey: LocaleKeys.settings,
        subtitleKey: LocaleKeys.settingsDesc,
      ),
      _MenuItemData(
        icon: Assets.svgsLogout,
        titleKey: LocaleKeys.logout,
        subtitleKey: LocaleKeys.logoutDesc,
        isLogout: true,
      ),
    ];

    return Column(
      children:
          menuItems.map((item) {
            return Column(
              children: [
                MoreMenuItem(
                  icon: item.icon,
                  title: item.titleKey.tr(),
                  subtitle: item.subtitleKey.tr(),
                  isLogout: item.isLogout,
                  onTap: () => _handleMenuTap(context, item.titleKey),
                ),
                if (item.titleKey != LocaleKeys.logout)
                  Divider(),
              ],
            );
          }).toList(),
    );
  }

  void _handleMenuTap(BuildContext context, String itemKey) {
    // Handle navigation based on item
    switch (itemKey) {
      case LocaleKeys.logout:
        _showLogoutDialog(context);
        break;
      // Add other navigation cases as needed
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(LocaleKeys.logout.tr()),
            content: Text(
              '${LocaleKeys.logout.tr()} ${LocaleKeys.continueQuestion.tr()}',
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: Text(LocaleKeys.back.tr()),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                  // TODO: Implement logout logic
                },
                child: Text(
                  LocaleKeys.yes.tr(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }
}

class _MenuItemData {
  final String icon;
  final String titleKey;
  final String subtitleKey;
  final bool isLogout;

  const _MenuItemData({
    required this.icon,
    required this.titleKey,
    required this.subtitleKey,
    this.isLogout = false,
  });
}
