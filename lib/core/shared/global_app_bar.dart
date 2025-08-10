import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/context_extensions.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/core/routing/app_routes.dart';
import 'package:gold/core/services/navigator/navigator_service.dart';
import 'package:gold/core/shared/app_bar_title.dart';
import 'package:gold/generated/assets.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({super.key, this.type});

  final CurrencyType? type;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      title:
          type == null
              ? Text(
                'goldPriceIn${AppConfig.instance.currentFlavor.capitalizeFirst}'
                    .tr(),
              )
              : AppBarTitle(type: type!),
      actionsPadding: EdgeInsetsDirectional.only(end: 8.w),
      actions:
          type == null
              ? null
              : [
                InkWell(
                  onTap: () {},
                  child: Image.asset(Assets.iconsShare, height: 24.h),
                ),
                8.horizontalSpace,
                InkWell(
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.calculatorView,
                      arguments: type,
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(Assets.iconsCalculator, height: 24.h),
                      4.verticalSpace,
                      Text(
                        '${type!.name}Calculator'.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
    );
  }

  @override
  Size get preferredSize =>
      Size(NavigatorService.getContext?.screenWidth ?? 0, kToolbarHeight);
}
