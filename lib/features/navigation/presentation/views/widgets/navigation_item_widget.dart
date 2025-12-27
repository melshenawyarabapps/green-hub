import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationItemWidget extends StatelessWidget {
  const NavigationItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    required this.changeIndex,
    required this.isActive,
  });

  final int index;
  final String icon;
  final String title;
  final Function(int index) changeIndex;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
          ),
          4.verticalSpace,
          BottomItemText(
            title: title,
            isActive: isActive,
          ),
        ],
      ),
    );
  }
}

class BottomItemText extends StatelessWidget {
  const BottomItemText({super.key, required this.title, required this.isActive});

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style:
          isActive
              ? textTheme.labelLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 12.sp,
              )
              : textTheme.labelLarge!.copyWith(
                color: textTheme.labelSmall!.color,
                fontSize: 12.sp,
              ),
    );
  }
}
