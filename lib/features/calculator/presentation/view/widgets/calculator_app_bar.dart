import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/context_extensions.dart';
import 'package:gold/core/services/navigator/navigator_service.dart';
import 'package:gold/core/shared/app_bar_title.dart';
import 'package:gold/generated/assets.dart';

class CalculatorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalculatorAppBar({super.key, required this.type,required this.onShareTap});

  final CurrencyType type;
final VoidCallback onShareTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: AppBarTitle(type: type, isCalculator: true),
      actions: [
        TextButton(
          onPressed: onShareTap,
          child: Image.asset(Assets.iconsShare, height: 24.h),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size(NavigatorService.getContext?.screenWidth ?? 0, kToolbarHeight);
}
