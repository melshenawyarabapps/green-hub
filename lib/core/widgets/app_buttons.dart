import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_styles.dart';
import 'package:greenhub/core/utils/font_sizes.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: SvgPicture.asset(Assets.svgsBack, height: 36.h, width: 36.w),
    );
  }
}

class AppSelectButton extends StatelessWidget {
  const AppSelectButton({super.key, this.onChanged, required this.value});

  final ValueChanged<bool?>? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final decorations = Theme.of(context).extension<AppDecorations>();
    return InkWell(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        height: 15.h,
        width: 15.w,
        decoration: value ? decorations?.selectedDecoration : decorations?.unselectedDecoration,
        child: Icon(
          Icons.check,
          color: value ? AppLightColors.whiteColor : AppLightColors.greyColor3,
          size: 10.h,
        ),
      ),
    );
  }
}

class AppSwitchButton extends StatelessWidget {
  const AppSwitchButton({super.key, this.onChanged, required this.value});

  final ValueChanged<bool?>? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final decorations = Theme.of(context).extension<AppDecorations>();
    return Transform.scale(
      scale: 0.5,
      child: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.color,
    this.textColor,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: isLoading
          ? SizedBox(
              height: 20.h,
              width: 20.h,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(title, style: TextStyle(color: textColor)),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    this.onPressed,
    this.black = false,
    this.primary = false,
  });

  const AppTextButton.black({
    super.key,
    required this.title,
    this.onPressed,
    this.black = true,
    this.primary = false,
  });

  const AppTextButton.primary({
    super.key,
    required this.title,
    this.onPressed,
    this.black = false,
    this.primary = true,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool black;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style:
            primary
                ? AppStyles.getBoldStyle(
                  color: theme.primaryColor,
                  fontSize: FontSizes.s12,
                )
                : black
                ? theme.textTheme.bodyMedium?.copyWith(fontSize: FontSizes.s14)
                : null,
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: Text(title));
  }
}
