import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';

class CircularPersonWidget extends StatelessWidget {
  const CircularPersonWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.1,
            ),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        shape: BoxShape.circle,
        color: context.theme.scaffoldBackgroundColor,
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
