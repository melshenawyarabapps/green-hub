import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/features/navigation/presentation/views/widgets/navigation_item_widget.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
    this.onTap,
    required this.currentIndex,
  });

  final Function(int index)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        MediaQuery.of(context).size.width,
        80.h,
      ),
      painter: RPSCustomPainter(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SizedBox(
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavigationItemWidget(
                    icon: currentIndex == 0 ? Assets.svgsHome : Assets.svgsInhome,
                    isActive: currentIndex == 0,
                    changeIndex: (index) {
                      onTap?.call(index);
                    },
                    title: LocaleKeys.home.tr(),
                    index: 0,
                  ),
                  NavigationItemWidget(
                    changeIndex: (index) {
                      onTap?.call(index);
                    },
                    isActive: currentIndex == 1,
                    icon: currentIndex == 1 ? Assets.svgsOffers : Assets.svgsInoffers,
                    title: LocaleKeys.offers.tr(),
                    index: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 80.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BottomItemText(
                    title: LocaleKeys.createOrder.tr(),
                    isActive: currentIndex == 2,
                  ),
                  18.verticalSpace,
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavigationItemWidget(
                    changeIndex: (index) {
                      onTap?.call(index);
                    },
                    isActive: currentIndex == 3,
                    icon: currentIndex == 3 ? Assets.svgsOrders : Assets.svgsInorders,
                    title: LocaleKeys.orders.tr(),
                    index: 3,
                  ),
                  NavigationItemWidget(
                    changeIndex: (index) {
                      onTap?.call(index);
                    },
                    isActive: currentIndex == 4,
                    icon: currentIndex == 4 ? Assets.svgsMore : Assets.svgsInmore,
                    title: LocaleKeys.more.tr(),
                    index: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final Color backgroundColor;

  RPSCustomPainter({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    const radius = 20.0;
    const notchWidth = 80.0;
    const notchDepth = 52.0; // Adjustable notch depth

    // Draw shadow first
    Paint shadowPaint =
        Paint()
          ..color = Colors.black.withValues(alpha: 0.1)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    Path shadowPath = _createNotchPath(size, radius, notchWidth, notchDepth);
    canvas.drawPath(shadowPath, shadowPaint);

    // Draw main background shape
    Paint paintFill0 =
        Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill
          ..strokeWidth = 0
          ..strokeCap = StrokeCap.butt
          ..strokeJoin = StrokeJoin.miter;

    Path path_0 = _createNotchPath(size, radius, notchWidth, notchDepth);
    canvas.drawPath(path_0, paintFill0);
  }

  Path _createNotchPath(Size size, double radius, double notchWidth, double notchDepth) {
    final double centerX = size.width / 2;
    final double notchRadiusX = notchWidth / 2; // Horizontal radius (wider)
    final double notchRadiusY = notchDepth; // Vertical radius (controls depth)
    const double curveDistance = 15.0; // Distance for the smooth curve transition

    Path path = Path();

    // Start from top-left corner
    path.moveTo(0, radius);

    // Top-left rounded corner
    path.quadraticBezierTo(
      0,
      0,
      radius,
      0,
    );

    // Top edge to left side of notch (before the curve starts)
    path.lineTo(centerX - notchRadiusX - curveDistance, 0);

    // Left smooth curve transition into the oval

    path.quadraticBezierTo(
      centerX - notchRadiusX,
      0,
      centerX - notchRadiusX + 5,
      notchDepth * 0.2,
    );

    // Oval/elliptical arc at the bottom of the notch
    path.arcToPoint(
      Offset(centerX + notchRadiusX - 5, notchDepth * 0.2),
      radius: Radius.elliptical(notchRadiusX, notchRadiusY),
      clockwise: false,
    );

    // Right smooth curve transition from the oval
    path.quadraticBezierTo(
      centerX + notchRadiusX,
      0,
      centerX + notchRadiusX + curveDistance,
      0,
    );

    // Top edge to top-right corner
    path.lineTo(size.width - radius, 0);

    // Top-right rounded corner
    path.quadraticBezierTo(
      size.width,
      0,
      size.width,
      radius,
    );

    // Right edge (straight to bottom)
    path.lineTo(size.width, size.height);

    // Bottom edge (straight)
    path.lineTo(0, size.height);

    // Left edge (straight up) - closes the path
    path.lineTo(0, radius);

    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
