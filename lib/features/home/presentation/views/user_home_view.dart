import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/features/home/presentation/views/widgets/app_bar_widgets/home_app_bar.dart';
import 'package:greenhub/features/home/presentation/views/widgets/user_banners/banner_section.dart';

import 'widgets/user_services/services_section.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // const SliverAppBar(
        //   automaticallyImplyLeading: false,
        //   expandedHeight: 240.0,
        //   flexibleSpace: HomeAppBar(
        //     isUser: true,
        //   ),
        // ),
        const SliverToBoxAdapter(
          child: HomeAppBar(
            isUser: true,
          ),
        ),
        SliverToBoxAdapter(
          child: 16.verticalSpace,
        ),
        const SliverToBoxAdapter(
          child: BannersSection(),
        ),
        SliverToBoxAdapter(
          child: 20.verticalSpace,
        ),
        const SliverToBoxAdapter(
          child: ServicesSection(),
        ),
        SliverToBoxAdapter(
          child: 120.verticalSpace,
        ),
      ],
    );
  }
}
