import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/generated/assets.dart';

class AddAddressWidget extends StatelessWidget {
  const AddAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.address.tr(),
          style: context.textTheme.headlineSmall,
        ),
        12.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LeadingIconsColumn(context),
            12.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _DistanceField(
                    context: context,
                    title: LocaleKeys.from.tr(),
                    hintText: LocaleKeys.determiningTheStartingPoint.tr(),
                  ),
                  36.verticalSpace,
                  _DistanceField(
                    context: context,
                    title: LocaleKeys.to.tr(),
                    hintText: LocaleKeys.destinationSelection.tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/*────────────────────────────────────────────*/
/*              LEADING ICONS                 */
/*────────────────────────────────────────────*/

class _LeadingIconsColumn extends StatelessWidget {
  const _LeadingIconsColumn(this.context);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        14.verticalSpace,
        const _LeadingIcon(
          iconPath: Assets.svgsLocation,
        ),
        _VerticalDottedDivider(),
        const _LeadingIcon(
          iconPath: Assets.svgsPackage,
        ),
      ],
    );
  }
}

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({
    required this.iconPath,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.theme.inputDecorationTheme.fillColor,
      ),
      child: CustomSvgBuilder(
        path: iconPath,
      ),
    );
  }
}

/*────────────────────────────────────────────*/
/*              DOTTED DIVIDER                */
/*────────────────────────────────────────────*/

class _VerticalDottedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.hvPadding(
        horizontal: 20,
        vertical: 6,
      ),
      child: Column(
        children: List.generate(
          8,
          (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Container(
              width: 2.w,
              height: 2.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppLightColors.greyColor6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*────────────────────────────────────────────*/
/*              DISTANCE FIELD                */
/*────────────────────────────────────────────*/

class _DistanceField extends StatelessWidget {
  const _DistanceField({
    required this.context,
    required this.title,
    required this.hintText,
  });

  final BuildContext context;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  $title :',
          style: context.primaryTextTheme.displayMedium,
        ),
        6.verticalSpace,
        AppTextFormField(
          hintText: hintText,
          suffixIcon: Padding(
            padding: AppPadding.onlyPadding(
              top: 12,
              bottom: 12,
            ),
            child: const CustomSvgBuilder(
              path: Assets.svgsGps,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
