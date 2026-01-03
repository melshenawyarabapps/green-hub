import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/available_vehicles_widgets/delivery_info_rating_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/circular_person_widget.dart';

import '../../../../../../generated/assets.dart';

class DeliveryInfoWidget extends StatelessWidget {
  const DeliveryInfoWidget({super.key, this.price});
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircularPersonWidget(
          imagePath: Assets.imagesMockPersonImg,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'معاذ خالد الحيطانى',
                style: context.textTheme.bodySmall,
              ),
              4.verticalSpace,
              if (price != null)
                Row(
                  children: [
                    Text(
                      '${LocaleKeys.price.tr()}/',
                      style: context.textTheme.displayLarge,
                    ),
                    Text(
                      ' $price ',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.theme.primaryColor,
                      ),
                    ),
                    CustomSvgBuilder(path: Assets.svgsSaudiRiyalSymbol, width: 10.w, height: 10.h),
                  ],
                ),
            ],
          ),
        ),
        const DeliveryInfoRatingWidget(),
      ],
    );
  }
}
