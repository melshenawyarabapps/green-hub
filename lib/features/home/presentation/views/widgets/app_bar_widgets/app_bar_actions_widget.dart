import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/widgets/app_bar_custom_button.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/features/home/presentation/views/widgets/app_bar_widgets/home_app_bar_location_widget.dart';

import '../../../../../../generated/assets.dart';

class AppBarActionsWidget extends StatelessWidget {
  const AppBarActionsWidget({super.key, required this.isUser});

  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const HomeAppBarLocationWidget(),
        const Spacer(),
        if (isUser)
          const AppBarCustomButton(
            child: CustomSvgBuilder(
              path: Assets.svgsChatIc,
            ),
          ),
        12.horizontalSpace,
        const AppBarCustomButton(
          child: Stack(
            children: [
              CustomSvgBuilder(
                path: Assets.svgsNotification,
              ),
              PositionedDirectional(
                start: 2,
                top: 0,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
