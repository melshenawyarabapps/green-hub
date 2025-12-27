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
        72.h,
      ),
      painter: NotchedNavigationBarPainter(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SizedBox(
        height: 72.h,
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
              height: 72.h,
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
    final radius = 20.0;

    // Scale factors to fit the notch to the screen width
    final notchOriginalWidth = 90.0;
    final notchOriginalHeight = 45.0;
    final notchScale = 1.0; // Adjust this to scale the notch size
    final notchWidth = notchOriginalWidth * notchScale;
    final notchHeight = notchOriginalHeight * notchScale;

    // Draw shadow first
    Paint shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.1)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    Path shadowPath = Path();

    // Start from top-left with rounded corner
    shadowPath.moveTo(radius, 0);

    // Top edge to left notch start
    shadowPath.lineTo(size.width * 0.5 - notchWidth / 2, 0);

    // Shape 1: Left side of notch (curves down)
    // Bezier curve from (90, 0) to (45, 45) with control points (73, 0) and (87.5, 45)
    // But we need to translate: start at current position, end at center bottom
    shadowPath.cubicTo(
      size.width * 0.5 - notchWidth / 2 + 73 * notchScale, // control point 1 x
      0, // control point 1 y
      size.width * 0.5 - notchWidth / 2 + 87.5 * notchScale, // control point 2 x
      notchHeight, // control point 2 y
      size.width * 0.5, // end point x (center)
      notchHeight, // end point y (bottom of notch)
    );

    // Shape 2: Right side of notch (curves back up)
    // Bezier curve from (45, 45) to (0, 0) with control points (2.5, 45) and (17.5, 0)
    // Translate: start at center bottom, end at right side of notch
    shadowPath.cubicTo(
      size.width * 0.5 + 2.5 * notchScale, // control point 1 x
      notchHeight, // control point 1 y
      size.width * 0.5 + 17.5 * notchScale, // control point 2 x
      0, // control point 2 y
      size.width * 0.5 + notchWidth / 2, // end point x
      0, // end point y
    );

    // Top edge to top-right
    shadowPath.lineTo(size.width - radius, 0);

    // Top-right rounded corner
    shadowPath.quadraticBezierTo(
      size.width,
      0,
      size.width,
      radius,
    );

    // Right edge (straight to bottom)
    shadowPath.lineTo(size.width, size.height);

    // Bottom edge (straight)
    shadowPath.lineTo(0, size.height);

    // Left edge (straight up)
    shadowPath.lineTo(0, radius);

    // Top-left rounded corner
    shadowPath.quadraticBezierTo(
      0,
      0,
      radius,
      0,
    );

    shadowPath.close();

    canvas.drawPath(shadowPath, shadowPaint);

    // Draw main background shape
    Paint paintFill0 = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();

    // Start from top-left with rounded corner
    path_0.moveTo(radius, 0);

    // Top edge to left notch start
    path_0.lineTo(size.width * 0.5 - notchWidth / 2, 0);

    // Shape 1: Left side of notch (curves down)
    // Bezier curve from (90, 0) to (45, 45) with control points (73, 0) and (87.5, 45)
    path_0.cubicTo(
      size.width * 0.5 - notchWidth / 2 + 73 * notchScale, // control point 1 x
      0, // control point 1 y
      size.width * 0.5 - notchWidth / 2 + 87.5 * notchScale, // control point 2 x
      notchHeight, // control point 2 y
      size.width * 0.5, // end point x (center)
      notchHeight, // end point y (bottom of notch)
    );

    // Shape 2: Right side of notch (curves back up)
    // Bezier curve from (45, 45) to (0, 0) with control points (2.5, 45) and (17.5, 0)
    path_0.cubicTo(
      size.width * 0.5 + 2.5 * notchScale, // control point 1 x
      notchHeight, // control point 1 y
      size.width * 0.5 + 17.5 * notchScale, // control point 2 x
      0, // control point 2 y
      size.width * 0.5 + notchWidth / 2, // end point x
      0, // end point y
    );

    // Top edge to top-right
    path_0.lineTo(size.width - radius, 0);

    // Top-right rounded corner
    path_0.quadraticBezierTo(
      size.width,
      0,
      size.width,
      radius,
    );

    // Right edge (straight to bottom)
    path_0.lineTo(size.width, size.height);

    // Bottom edge (straight)
    path_0.lineTo(0, size.height);

    // Left edge (straight up)
    path_0.lineTo(0, radius);

    // Top-left rounded corner
    path_0.quadraticBezierTo(
      0,
      0,
      radius,
      0,
    );

    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class NotchedNavigationBarPainter extends CustomPainter {
  final Color backgroundColor;

  NotchedNavigationBarPainter({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 20.0;

    // Notch size relative to screen width
    final double notchWidth = 90.0;
    final double notchHeight = 45.0;

    final double centerX = size.width / 2;

    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Start from top-left corner with rounded radius
    path.moveTo(radius, 0);
    path.lineTo(centerX - notchWidth / 2, 0);

    // Left side of notch (Bezier)
    path.cubicTo(
      centerX - notchWidth / 2 + 73, // control point 1 x
      0,                             // control point 1 y
      centerX - notchWidth / 2 + 87.5, // control point 2 x
      notchHeight,                   // control point 2 y
      centerX,                       // end point x
      notchHeight,                   // end point y
    );

    // Right side of notch (Bezier)
    path.cubicTo(
      centerX + 2.5,                 // control point 1 x
      notchHeight,                   // control point 1 y
      centerX + 17.5,                // control point 2 x
      0,                             // control point 2 y
      centerX + notchWidth / 2,      // end point x
      0,                             // end point y
    );

    // Top-right rounded corner
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right edge
    path.lineTo(size.width, size.height);

    // Bottom edge
    path.lineTo(0, size.height);

    // Left edge
    path.lineTo(0, radius);

    // Top-left rounded corner
    path.quadraticBezierTo(0, 0, radius, 0);

    path.close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.1), 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
