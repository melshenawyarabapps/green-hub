import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/features/boarding/presentation/cubit/boarding_cubit.dart';
import 'package:greenhub/features/boarding/presentation/widgets/boarding_indicator.dart';
import 'package:greenhub/features/boarding/presentation/widgets/boarding_page_content.dart';
import 'package:greenhub/features/boarding/presentation/widgets/fixed_next_button.dart';

class BoardingView extends StatefulWidget {
  const BoardingView({super.key});

  @override
  State<BoardingView> createState() => _BoardingViewState();
}

class _BoardingViewState extends State<BoardingView> {
  late final PageController _pageController;
  late final BoardingCubit _boardingCubit;

  @override
  void initState() {
    _pageController = PageController();
    _boardingCubit = context.read<BoardingCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BoardingCubit, BoardingState>(
      listener: (context, state) {
        if (state.status == BoardingStatus.navigateToBeforeAuth) {
          context.pushNamed(AppRoutes.beforeAuthView);
        }
        if (state.animateToPage) {
          _pageController.animateToPage(
            state.currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCubic,
          );
          _boardingCubit.resetAnimateToPage();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (page) {
                  _boardingCubit.onPageChanged(page);
                },
                itemBuilder:
                    (_, index) => BoardingPageContent(pageIndex: index),
              ),
              PositionedDirectional(
                top: context.topPadding,
                start: 0,
                end: 0,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, -20 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: Center(
                    child: BoardingIndicator(
                      currentIndex: state.currentIndex,
                      totalPages: 3,
                      onSkipPressed: () {
                        _boardingCubit.completeBoardingAndNavigate();
                      },
                    ),
                  ),
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                end: 0,
                child: FixedNextButton(
                  onPressed: () {
                    _boardingCubit.nextPage();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
