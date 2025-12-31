import 'package:flutter/material.dart';

import '../../../../../../generated/assets.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        Assets.imagesMockBanner,
        height: 144,
        fit: BoxFit.cover,
      ),
    );
  }
}
