import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';

class VerificationTitle extends StatelessWidget {
  const VerificationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        48.verticalSpace,
        SvgPicture.asset(Assets.svgsCode),
        24.verticalSpace,
        Text(
          LocaleKeys.verificationCode.tr(),
          style: textTheme.bodyMedium,
        ),
        16.verticalSpace,
        Text(
          LocaleKeys.verificationCodeDescription.tr(),
          style: textTheme.displayMedium,
        ),
      ],
    );
  }
}

