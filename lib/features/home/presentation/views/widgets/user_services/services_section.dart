import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/features/home/presentation/views/widgets/home_titles_widget.dart';
import 'package:greenhub/features/home/presentation/views/widgets/user_services/service_item_widget.dart';
import 'package:greenhub/generated/assets.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitlesWidget(
          title: LocaleKeys.servicesTitle.tr(),
        ),
        12.verticalSpace,
        Row(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ServiceItemWidget(
                imagePath: Assets.imagesMockService1,
                title: LocaleKeys.service1Title.tr(),
                description: LocaleKeys.service1Description.tr(),
                buttonColor: context.theme.primaryColor,
                onPressed: () {
                  context.pushNamed(
                    AppRoutes.availableVehiclesView,
                  );
                },
              ),
            ),
            Expanded(
              child: ServiceItemWidget(
                imagePath: Assets.imagesMockService2,
                title: LocaleKeys.service2Title.tr(),
                description: LocaleKeys.service2Description.tr(),
                buttonColor: context.theme.secondaryHeaderColor,
                onPressed: () {
                  context.pushNamed(
                    AppRoutes.availableVehiclesView,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
