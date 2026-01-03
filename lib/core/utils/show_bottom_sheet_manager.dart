import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';

class ShowBottomSheetManager {
  static Future show({
    required BuildContext context,
    required Widget bottomSheet,
    bool isDismissible = true,
  }) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(
        alpha: 0.2,
      ),
      isScrollControlled: true,
      isDismissible: isDismissible,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: Colors.black.withValues(
                  alpha: 0.01,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomSheet,
            ),
          ],
        );
      },
    );
  }

  static Future showSuccess(
    context, {
    bool enableDrag = false,
    bool isDismissible = true,
    required String title,
    String? subTitle,
  }) async {
    await showModalBottomSheet(
      context: context,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(
        alpha: 0.2,
      ),
      builder:
          (context) => Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.black.withValues(
                    alpha: 0.01,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SuccessBottomSheet(
                  title: title,
                  subTitle: subTitle,
                ),
              ),
            ],
          ),
    );
  }
}
