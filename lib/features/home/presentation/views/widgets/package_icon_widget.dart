import 'package:flutter/material.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';

import '../../../../../generated/assets.dart';

class PackageIconWidget extends StatelessWidget {
  const PackageIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: AppLightColors.greyColor2,
      child: const CustomSvgBuilder(
        path: Assets.svgsOrderPackageIc,
        width: 16,
        height: 16,
      ),
    );
  }
}
