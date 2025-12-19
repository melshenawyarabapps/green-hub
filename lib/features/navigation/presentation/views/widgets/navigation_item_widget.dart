import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationItemWidget extends StatelessWidget {
  const NavigationItemWidget({
    super.key,
    required this.currentIndex,
    required this.icon,
    required this.title,
    required this.index,
  });

  final ValueNotifier<int> currentIndex;

  final int index;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final isActive = currentIndex.value == index;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        currentIndex.value = index;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
          ),
          4.verticalSpace,
          Text(
            title,
            style: isActive ? textTheme.labelMedium : textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
