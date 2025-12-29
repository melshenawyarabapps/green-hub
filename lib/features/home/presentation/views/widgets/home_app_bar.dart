import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_bar_custom_button.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/features/home/presentation/views/widgets/home_app_bar_location_widget.dart';
import 'package:greenhub/generated/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.isUser});

  final bool isUser;

  @override
  Widget build(BuildContext context) {
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
          Row(
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
                child: CustomSvgBuilder(
                  path: Assets.svgsNotification,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            isUser ? 'Welcome Back!' : 'Hello Admin!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
