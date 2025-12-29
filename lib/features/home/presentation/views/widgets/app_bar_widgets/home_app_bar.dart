import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/features/home/presentation/views/widgets/app_bar_widgets/app_bar_actions_widget.dart';
import 'package:greenhub/generated/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.isUser});

  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      height: 254,
      padding: AppPadding.onlyPadding(
        top: MediaQuery.paddingOf(context).top + 8,
        bottom: 26,
        start: 20,
        end: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          28,
        ),
        image: const DecorationImage(
          image: AssetImage(
            Assets.imagesHomeAppBarBackground,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarActionsWidget(
            isUser: isUser,
          ),
          20.verticalSpace,
          Text(
            isUser ? LocaleKeys.userAppBarTitle.tr() : LocaleKeys.deliveryAppBarTitle.tr(),
            style: textTheme.headlineMedium,
          ),
          12.verticalSpace,
          Text(
            isUser ? LocaleKeys.userAppBarSubTitle.tr() : LocaleKeys.deliveryAppBarSubTitle.tr(),
            style: textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
