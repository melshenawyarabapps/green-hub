import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/utils/font_sizes.dart';
import 'package:gold/generated/assets.dart';

class ChangeWidget extends StatelessWidget {
  const ChangeWidget({super.key, required this.isUp, required this.price});
final bool isUp;
final String price;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(isUp?Assets.iconsTrendUp:Assets.iconsTrendDown, height: 14.h),
          2.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: FontSizes.instance.s10,
                ),
              ),
              4.horizontalSpace,
              Image.asset(AppConfig.instance.appCurrency, height: 10.h),
            ],
          ),
        ],
      ),
    );
  }
}
