import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';

class OrderListDestinationWidget extends StatelessWidget {
  const OrderListDestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _headerBuild(
          context: context,
        ),
        8.verticalSpace,
        _buildBody(
          context: context,
        ),
      ],
    );
  }

  Widget _headerBuild({
    required BuildContext context,
  }) {
    return Row(
      spacing: 6.w,
      children: [
        Container(
          width: 22.w,
          height: 22.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.theme.primaryColor,
              width: 1,
            ),
          ),
          child: Icon(
            Icons.location_on_sharp,
            color: context.theme.primaryColor,
            size: 12.r,
          ),
        ),
        Expanded(
          child: Row(
            spacing: 4.w,
            children: List.generate(
              30,
              (index) => Expanded(
                child: Container(
                  height: 2.h,
                  width: 2.w,
                  decoration: BoxDecoration(
                    color: AppLightColors.greyColor6,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 14.r,
          backgroundColor: AppLightColors.greyColor2,
          child: Icon(
            Icons.location_on_sharp,
            color: AppLightColors.greyColor3,
            size: 14.r,
          ),
        ),
        48.horizontalSpace,
      ],
    );
  }

  Widget _buildBody({
    required BuildContext context,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDistenation(
          context: context,
          title: LocaleKeys.from.tr(),
          value: 'العليا، الرياض ',
        ),
        _buildDistenation(
          context: context,
          title: LocaleKeys.to.tr(),
          value: 'حي الروضة، جدة',
        ),
      ],
    );
  }

  Widget _buildDistenation({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.labelSmall?.copyWith(
            color: Colors.black.withValues(alpha: 0.6),
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: context.textTheme.labelSmall?.copyWith(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
