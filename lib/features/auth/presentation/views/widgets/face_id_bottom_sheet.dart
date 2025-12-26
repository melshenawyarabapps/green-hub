import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/navigator/navigator_service.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/generated/assets.dart';

class FaceIdBottomSheet extends StatelessWidget {
  const FaceIdBottomSheet({super.key});

  static Future show(context) async{
   await showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) => const FaceIdBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Container(
      decoration: decorations?.borderWhite20Decoration,
      padding: AppPadding.onlyPadding(top: AppPadding.p12),
      margin: AppPadding.onlyPadding(bottom: context.bottomPadding),
      child: Container(
        height: 470.h,
        width: double.infinity,
        decoration: decorations?.borderWhiteDecoration,
        padding: AppPadding.horizontalPadding(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            32.verticalSpace,
            Text(LocaleKeys.addFaceId.tr(), style: textTheme.bodyMedium),
            32.verticalSpace,
            SvgPicture.asset(Assets.svgsFaceId),
            24.verticalSpace,
            Text(
              LocaleKeys.photoFace.tr(),
              style: textTheme.bodyMedium?.copyWith(
                fontSize: FontSizes.s20,
                fontWeight: FontWeights.semiBold,
              ),
            ),
            12.verticalSpace,
            Text(
              LocaleKeys.photoFaceDescription.tr(),
              textAlign: TextAlign.center,
              style: textTheme.displayMedium?.copyWith(
                fontWeight: FontWeights.bold,
              ),
            ),

            32.verticalSpace,
            AppElevatedButton(
              title: LocaleKeys.startNow.tr(),
              onPressed: () async {
                context.pop();

                // try {
                //   final LocalAuthentication auth = LocalAuthentication();
                //   final bool canAuthenticateWithBiometrics =
                //       await auth.canCheckBiometrics;
                //   final bool canAuthenticate =
                //       canAuthenticateWithBiometrics ||
                //       await auth.isDeviceSupported();
                //   if (canAuthenticate) {
                //     await auth.authenticate(
                //       localizedReason: LocaleKeys.phoneNumber.tr(),
                //     );
                //   }
                // } catch (_) {}

              },
            ),
          ],
        ),
      ),
    );
  }
}
