import 'package:flutter/material.dart';

class BoardingView extends StatefulWidget {
  const BoardingView({super.key});

  @override
  State<BoardingView> createState() => _BoardingViewState();
}

class _BoardingViewState extends State<BoardingView> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 3,
            itemBuilder:
                (_, index) => Stack(
                  children: [
                    Image.asset('assets/images/boarding${index + 1}.png'),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
