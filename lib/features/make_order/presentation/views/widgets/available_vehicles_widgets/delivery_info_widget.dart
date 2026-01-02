import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/available_vehicles_widgets/delivery_info_rating_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/circular_person_widget.dart';

import '../../../../../../generated/assets.dart';

class DeliveryInfoWidget extends StatelessWidget {
  const DeliveryInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularPersonWidget(
          imagePath: Assets.imagesMockPersonImg,
        ),
        Text(
          'معاذ خالد الحيطانى',
          style: context.textTheme.bodySmall,
        ),
        const DeliveryInfoRatingWidget(),
      ],
    );
  }
}
