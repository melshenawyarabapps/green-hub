import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

import '../../../../../../generated/assets.dart';

class HomeAppBarLocationWidget extends StatelessWidget {
  const HomeAppBarLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    return Container(
      padding: AppPadding.hvPadding(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff4B9C86),
            Color(0xff7EB87D),
          ],
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: AppPadding.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.secondaryHeaderColor,
            ),
            child: SvgPicture.asset(
              Assets.svgsLocation,
              width: 16.w,
              height: 16.h,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          6.horizontalSpace,
          Text(
            'ش عمرو بن العاص،الدمام',
            style: textTheme.labelSmall!.copyWith(
              color: theme.scaffoldBackgroundColor,
            ),
          ),
          2.horizontalSpace,
          Icon(
            Icons.keyboard_arrow_down,
            color: theme.scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}
