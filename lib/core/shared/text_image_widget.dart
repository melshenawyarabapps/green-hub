import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/directional_enums.dart';
import 'package:gold/core/utils/app_padding.dart';

class TextImageWidget extends StatelessWidget {
  const TextImageWidget({
    super.key,
    required this.text,
    required this.imagePath,
     this.directionalType=DirectionalType.start,
    this.isDollar = false,
    this.showIcon = true,
  });

  final String text;
  final String imagePath;
  final DirectionalType directionalType;
  final bool isDollar;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: AppPadding.instance.horizontalPadding(AppPadding.instance.p8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showIcon&&!isDollar&&directionalType.isStart) ...[
              Image.asset(imagePath, height: 32.h),
              4.horizontalSpace,
            ],
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text + (!isDollar ? '' :' \$'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            if (showIcon&&!isDollar&&directionalType.isEnd) ...[
              4.horizontalSpace,
              Image.asset(imagePath, height: 16.h),
            ],
          ],
        ),
      ),
    );
  }
}
