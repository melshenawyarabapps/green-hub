import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';

class MoreMenuItem extends StatelessWidget {
  const MoreMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.isLogout = false,
  });

  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon.endsWith('png') ? Image.asset(icon) : SvgPicture.asset(icon),
          8.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    isLogout
                        ? textTheme.labelLarge
                        : textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeights.semiBold,
                          fontSize: FontSizes.s13,
                        ),
              ),
              4.verticalSpace,
              Text(
                subtitle,
                style: textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeights.medium,
                  fontSize: FontSizes.s10,
                ),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(Assets.svgsArrowEnd),
        ],
      ),
    );
  }
}
