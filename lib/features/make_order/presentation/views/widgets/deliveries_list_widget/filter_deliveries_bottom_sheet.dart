import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/custom_range_selector_widget.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/core/widgets/notch_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/custom_drop_down_menu.dart';
import 'package:greenhub/generated/assets.dart';

class FilterDeliveriesBottomSheet extends StatelessWidget {
  const FilterDeliveriesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.onlyPadding(
        top: 0,
        start: 24,
        end: 24,
        bottom: 32,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const NotchWidget(),
          const _FilterHeader(),
          Padding(
            padding: AppPadding.hvPadding(
              vertical: 28,
            ),
            child: const Divider(
              height: 0.5,
              color: Color(0xffE1E9EF),
            ),
          ),
          const _FilterByPrice(),
          28.verticalSpace,
          const _FilterWithRate(),
          28.verticalSpace,
          const _DistanceFilterWidget(),
          28.verticalSpace,
          Row(
            spacing: 12.w,
            children: [
              Expanded(
                child: AppElevatedButton(
                  onPressed: () {
                    // if (onPressed != null) {
                    //   onPressed!();
                    // }
                  },
                  title: LocaleKeys.apply.tr(),
                  color: context.theme.primaryColor,
                ),
              ),
              Expanded(
                child: AppElevatedButton(
                  onPressed: () {},
                  title: LocaleKeys.reset.tr(),
                  color: context.theme.secondaryHeaderColor,
                  textColor: AppLightColors.blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterWithRate extends StatelessWidget {
  const _FilterWithRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.deliveryRating.tr(),
          style: context.primaryTextTheme.titleMedium,
        ),
        14.verticalSpace,
        CustomDropdownWidget(
          items: const [
            '4.0 +',
            '4.5 +',
            '5.0',
          ],
          hint: '3',
          itemLabelBuilder: (item) => item,
        ),
      ],
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LocaleKeys.classification.tr(),
          style: context.primaryTextTheme.bodyMedium,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppLightColors.greyColor3),
            ),
            child: Icon(
              Icons.close_rounded,
              size: 16,
              fontWeight: FontWeight.w800,
              color: AppLightColors.greyColor3,
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterByPrice extends StatefulWidget {
  const _FilterByPrice();

  @override
  State<_FilterByPrice> createState() => _FilterByPriceState();
}

class _FilterByPriceState extends State<_FilterByPrice> {
  double _currentRangeStart = 200;
  double _currentRangeEnd = 400;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.price.tr(),
          style: context.primaryTextTheme.titleMedium,
        ),
        8.verticalSpace,
        Row(
          children: [
            _buildTitle('40'),
            const Spacer(),
            _buildTitle('2000'),
          ],
        ),
        14.verticalSpace,
        CustomRangeSlider(
          min: 40,
          max: 2000,
          startValue: _currentRangeStart,
          endValue: _currentRangeEnd,
          startThumb: CircleAvatar(
            radius: 12,
            backgroundColor: context.theme.secondaryHeaderColor,
            child: CircleAvatar(
              radius: 6,
              backgroundColor: context.theme.primaryColor,
            ),
          ),
          endThumb: CircleAvatar(
            radius: 12,
            backgroundColor: context.theme.secondaryHeaderColor,
            child: CircleAvatar(
              radius: 6,
              backgroundColor: context.theme.primaryColor,
            ),
          ),
          onChanged: (double start, double end) {
            setState(() {
              _currentRangeStart = start;
              _currentRangeEnd = end;
            });
          },
        ),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Row(
      children: [
        Text(
          '$title ',
          style: context.textTheme.bodySmall,
        ),
        CustomSvgBuilder(
          path: Assets.svgsSaudiRiyalSymbol,
          color: AppLightColors.greyColor3,
          width: 10,
          height: 10,
        ),
      ],
    );
  }
}

class _DistanceFilterWidget extends StatefulWidget {
  const _DistanceFilterWidget();

  @override
  State<_DistanceFilterWidget> createState() => _DistanceFilterWidgetState();
}

class _DistanceFilterWidgetState extends State<_DistanceFilterWidget> {
  double _selectedDistance = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.distance.tr(),
          style: context.primaryTextTheme.titleMedium,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Padding(
            padding: AppPadding.onlyPadding(top: 0),
            child: Text(
              '80 Km',
              style: context.textTheme.bodySmall,
            ),
          ),
        ),
        14.verticalSpace,
        CustomRangeSlider(
          min: 0,
          max: 80,
          startValue: 0,
          endValue: _selectedDistance,
          startThumb: const SizedBox(),
          endThumb: CircleAvatar(
            radius: 12,
            backgroundColor: context.theme.secondaryHeaderColor,
            child: CircleAvatar(
              radius: 6,
              backgroundColor: context.theme.primaryColor,
            ),
          ),
          onChanged: (double start, double end) {
            setState(() {
              _selectedDistance = end;
            });
          },
        ),
      ],
    );
  }
}
