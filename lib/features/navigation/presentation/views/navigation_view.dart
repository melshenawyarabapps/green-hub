import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gold/features/ads/presentation/controllers/ads_controller.dart';
import 'package:gold/features/bullion/presentation/views/bullion_view.dart';
import 'package:gold/features/currencies/presentation/views/currencies_view.dart';
import 'package:gold/features/gold/presentation/views/gold_view.dart';
import 'package:gold/features/more/presentation/views/more_view.dart';
import 'package:gold/features/navigation/presentation/views/widgets/navigation_bar_widget.dart';

class NavigationView extends StatefulHookWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final adsController = context.read<AdsController>();
      adsController.listenToAppStateChanges();
      adsController.loadAppOpenAd();
    });
  }

  int _attempts = 0;

  void addToAttempts() {
    _attempts++;
    if (_attempts == 1 || _attempts % 5 == 0) {
      context.read<AdsController>().loadInterstitialAd();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = usePageController(initialPage: 0);
    final currentIndex = useState(0);
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        onPageChanged: (index) {
          currentIndex.value = index;
          addToAttempts();
        },
        itemBuilder:
            (_, index) =>
                const [
                  GoldView(),
                  CurrenciesView(),
                  BullionView(),
                  MoreView(),
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
