import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/features/navigation/presentation/views/widgets/navigation_item_widget.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key, required this.currentIndex});

  final ValueNotifier<int> currentIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 72.h,
          color: Theme.of(context).canvasColor,
        ),
        BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.w,
          height: 72.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavigationItemWidget(
                      currentIndex: currentIndex,
                      icon:
                          currentIndex.value == 0
                              ? Assets.svgsHome
                              : Assets.svgsInhome,
                      title: LocaleKeys.home.tr(),
                      index: 0,
                    ),
                    NavigationItemWidget(
                      currentIndex: currentIndex,
                      icon:
                          currentIndex.value == 1
                              ? Assets.svgsOffers
                              : Assets.svgsInoffers,
                      title: LocaleKeys.offers.tr(),
                      index: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80.w,
                height: 72.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      LocaleKeys.createOrder.tr(),
                      style:
                          currentIndex.value==2
                              ? textTheme.labelMedium
                              : textTheme.labelSmall,
                    ),4.verticalSpace,
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavigationItemWidget(
                      currentIndex: currentIndex,
                      icon:
                          currentIndex.value == 3
                              ? Assets.svgsOrders
                              : Assets.svgsInorders,
                      title: LocaleKeys.orders.tr(),
                      index: 3,
                    ),
                    NavigationItemWidget(
                      currentIndex: currentIndex,
                      icon:
                          currentIndex.value == 4
                              ? Assets.svgsMore
                              : Assets.svgsInmore,
                      title: LocaleKeys.more.tr(),
                      index: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
