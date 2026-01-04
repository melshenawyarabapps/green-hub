import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/features/home/presentation/views/widgets/app_bar_widgets/home_app_bar.dart';
import 'package:greenhub/features/home/presentation/views/widgets/driver_widget/home_wallet_widget.dart';
import 'package:greenhub/features/home/presentation/views/widgets/driver_widget/new_order_item_widget.dart';
import 'package:greenhub/features/home/presentation/views/widgets/home_titles_widget.dart';
import 'package:greenhub/features/orders/data/enums/order_states_enum.dart';
import 'package:greenhub/features/orders/data/enums/orders_list_enum.dart';
import 'package:greenhub/features/orders/presentation/views/widgets/orders_list_widgets/order_list_item_widget/order_list_item_widget.dart';

class DeliveryHomeView extends StatelessWidget {
  const DeliveryHomeView({super.key});

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
            isUser: false,
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              HomeTitlesWidget(
                title: LocaleKeys.yourWallet.tr(),
              ),
              12.verticalSpace,
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: AppPadding.horizontalPadding(
              20,
            ),
            child: const HomeWalletWidget(),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              18.verticalSpace,
              HomeTitlesWidget(
                title: LocaleKeys.newOrders.tr(),
                actionWidget: GestureDetector(
                  onTap: () {},
                  child: Text(
                    LocaleKeys.seeAll.tr(),
                    style: context.textTheme.displayLarge,
                  ),
                ),
              ),
              12.verticalSpace,
            ],
          ),
        ),
        SliverList.separated(
          itemBuilder: (context, index) {
            return const NewOrderItemWidget();
          },
          separatorBuilder: (context, index) => 12.verticalSpace,
          itemCount: 5,
        ),
        SliverToBoxAdapter(
          child: 100.verticalSpace,
        ),
        // const SliverToBoxAdapter(
        //   child: ServicesSection(),
        // ),
        // SliverToBoxAdapter(
        //   child: 120.verticalSpace,
        // ),
      ],
    );
  }
}
