import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/directional_enums.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/core/shared/network_image_widget.dart';
import 'package:gold/core/utils/app_padding.dart';

class TextImageWidget extends StatelessWidget {
  const TextImageWidget({
    super.key,
    required this.text,
    required this.imagePath,
    required this.mainAxisAlignment,
    this.directionalType = DirectionalType.start,
    this.isDollar = false,
    this.showIcon = true,
  });

  final String text;
  final String imagePath;
  final DirectionalType directionalType;
  final bool isDollar;
  final bool showIcon;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: AppPadding.instance.horizontalPadding(AppPadding.instance.p8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (showIcon && !isDollar && directionalType.isStart&&imagePath.isNotEmpty) ...[
              ImageView(imagePath: imagePath),
              4.horizontalSpace,
            ],
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text.formatNumber + (!isDollar ? '' : ' \$'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            if (showIcon && !isDollar && directionalType.isEnd&&imagePath.isNotEmpty) ...[
              4.horizontalSpace,
              ImageView(imagePath: imagePath),
            ],
          ],
        ),
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.h,
      child:
          imagePath.isNetwork
              ? NetworkImageWidget(imageUrl: imagePath, fit: BoxFit.contain,emptyHolder: true,)
              : Image.asset(imagePath),
    );
  }
}
