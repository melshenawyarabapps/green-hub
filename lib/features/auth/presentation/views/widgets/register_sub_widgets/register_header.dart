import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class RegisterHeader extends StatelessWidget {
  final bool isUser;

  const RegisterHeader({super.key, required this.isUser});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return SafeArea(
      child: Padding(
        padding: AppPadding.onlyPadding(top: 16.h),
        child: Row(
          mainAxisAlignment:
              isUser
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
          children: [
            if (isUser) SvgPicture.asset(Assets.svgsWhiteLogo),
            if (!isUser) ...[
              Padding(
                padding: AppPadding.onlyPadding(start: AppPadding.p16),
                child: AppBackButton(),
              ),
              Text(
                LocaleKeys.setupProfile.tr(),
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeights.bold,
                  fontSize: FontSizes.s24,
                ),
              ),
              16.horizontalSpace,
            ],
          ],
        ),
      ),
    );
  }
}
