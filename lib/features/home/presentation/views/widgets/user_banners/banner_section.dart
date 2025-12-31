import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/features/home/presentation/views/widgets/home_titles_widget.dart';
import 'package:greenhub/features/home/presentation/views/widgets/user_banners/banner_item.dart';

class BannersSection extends StatefulWidget {
  const BannersSection({super.key});

  @override
  State<BannersSection> createState() => _BannersSectionState();
}

class _BannersSectionState extends State<BannersSection> {
  final CarouselSliderController controller = CarouselSliderController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitlesWidget(
          title: LocaleKeys.bannersTitle.tr(),
        ),
        12.verticalSpace,
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CarouselSlider.builder(
              carouselController: controller,
              options: CarouselOptions(
                height: 140.h,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) => setState(() => activeIndex = index),
              ),
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return const BannerItem();
              },
            ),
            Positioned(
              bottom: 8.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _isActive(index) ? 20.w : 10.w,
                    height: 6.h,
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.h),
                      color: _isActive(index) ? Colors.white : Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _isActive(int index) {
    return index == activeIndex;
  }
}
