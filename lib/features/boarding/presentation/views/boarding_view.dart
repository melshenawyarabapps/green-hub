import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class BoardingView extends StatefulWidget {
  const BoardingView({super.key});

  @override
  State<BoardingView> createState() => _BoardingViewState();
}

class _BoardingViewState extends State<BoardingView> {
  late final PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>();
    final textTheme = theme.textTheme;
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (page) {
              setState(() {
                currentIndex = page;
              });
            },
            itemBuilder:
                (_, index) => Stack(
                  children: [
                    Image.asset(
                      'assets/images/boarding${index + 1}.png',
                      width: 375.w,
                      height: 800.h,
                      fit: BoxFit.fill,
                    ),
                    PositionedDirectional(
                      bottom: 32.h,
                      child: SizedBox(
                        width: 375.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: AppPadding.horizontalPadding(
                                AppPadding.p24,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      '${AppConfig.instance.currentFlavor}BoardingTitle${index + 1}1'
                                          .tr(),
                                  style: textTheme.titleLarge,
                                  children: [
                                    TextSpan(
                                      text:
                                          '${AppConfig.instance.currentFlavor}BoardingTitle${index + 1}2'
                                              .tr(),
                                      style: textTheme.bodyLarge,
                                    ),
                                    TextSpan(
                                      text:
                                          '${AppConfig.instance.currentFlavor}BoardingTitle${index + 1}3'
                                              .tr(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            16.verticalSpace,
                            Padding(
                              padding: AppPadding.horizontalPadding(
                                AppPadding.p8,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'userBoardingDescription${index + 1}'.tr(),
                                    style: textTheme.titleMedium,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            32.verticalSpace,

                            AppElevatedButton(
                              title: LocaleKeys.next.tr(),
                              onPressed: () {
                                if (currentIndex == 2) {
                                } else {
                                  _pageController.animateToPage(
                                    currentIndex + 1,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.easeIn,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          ),
          PositionedDirectional(
            top: context.topPadding,
            child: SizedBox(
              width: 335.w,
              height: 32.h,
              child: Row(
                spacing: 6.w,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int inner = 0; inner < 3; inner++)
                    Container(
                      height: 8.h,
                      width: 93.w,
                      decoration:
                          inner == currentIndex
                              ? decorations?.circleWhiteDecoration
                              : decorations?.circleWhite20Decoration,
                    ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      Assets.svgsSkip,
                      width: 32.w,
                      height: 32.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
