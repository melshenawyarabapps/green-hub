import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gold/features/navigation/presentation/views/widgets/navigation_item_widget.dart';
import 'package:gold/generated/assets.dart';
import 'package:gold/translations/locale_keys.g.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.controller,
  });

  final ValueNotifier<int> currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
          BottomNavigationBarItem(
            icon: NavigationItemWidget(imagePath: Assets.iconsGoldUnselected,),
            label: LocaleKeys.gold.tr(),
            activeIcon: NavigationItemWidget(
              imagePath: Assets.iconsGoldSelected,
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationItemWidget(imagePath: Assets.iconsCurrenciesUnselected),
            label: LocaleKeys.currencies.tr(),
            activeIcon: NavigationItemWidget(
              imagePath: Assets.iconsCurrenciesSelected,
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationItemWidget(imagePath: Assets.iconsBullionUnselected),
            label: LocaleKeys.bullion.tr(),
            activeIcon: NavigationItemWidget(
              imagePath: Assets.iconsBullionSelected,
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationItemWidget(imagePath: Assets.iconsMoreUnselected),
            label: LocaleKeys.more.tr(),
            activeIcon: NavigationItemWidget(
              imagePath: Assets.iconsMoreSelected,
            ),
          ),
      ],
      onTap: (index) {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
      currentIndex: currentIndex.value,
    );
  }
}
