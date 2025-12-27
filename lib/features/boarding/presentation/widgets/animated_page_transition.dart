import 'package:flutter/material.dart';

class AnimatedPageTransition extends StatelessWidget {
  final Widget child;
  final int pageIndex;
  final int currentIndex;

  const AnimatedPageTransition({
    super.key,
    required this.child,
    required this.pageIndex,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = pageIndex == currentIndex;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isActive ? 1.0 : 0.8,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: isActive ? 1.0 : 0.95,
        child: child,
      ),
    );
  }
}

