import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';

import '../../../../../../generated/assets.dart';

class DeliveryInfoRatingWidget extends StatelessWidget {
  const DeliveryInfoRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color(0xffFFBA08);
    return Container(
      padding: AppPadding.hvPadding(
        horizontal: 8.5,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(
          alpha: 0.09,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        spacing: 2,
        children: [
          Text(
            '4.5',
            style: context.textTheme.labelSmall!.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          CustomSvgBuilder(
            path: Assets.svgsOutlineStar,
            width: 10.w,
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
