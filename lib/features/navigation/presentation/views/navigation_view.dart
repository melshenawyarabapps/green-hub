import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gold/features/bullion/presentation/views/bullion_view.dart';
import 'package:gold/features/currencies/presentation/views/currencies_view.dart';
import 'package:gold/features/gold/presentation/views/gold_view.dart';
import 'package:gold/features/navigation/presentation/views/widgets/navigation_bar_widget.dart';

class NavigationView extends HookWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController(initialPage: 0);
    final currentIndex = useState(0);
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        onPageChanged: (index) {
          currentIndex.value = index;
        },
        itemBuilder:
            (_, index) =>
                [
                  GoldView(),
                  CurrenciesView(),
                  BullionView(),
                  SizedBox.shrink(),
                ][index],
        itemCount: 4,
      ),
      bottomNavigationBar: NavigationBarWidget(
        currentIndex: currentIndex,
        controller: controller,
      ),
    );
  }
}
