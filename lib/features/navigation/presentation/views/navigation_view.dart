import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/features/more/presentation/views/more_view.dart';
import 'package:greenhub/features/navigation/presentation/views/widgets/navigation_bar_widget.dart';
import 'package:greenhub/features/navigation/presentation/views/widgets/notch_widget.dart';

class NavigationView extends HookWidget {
  const NavigationView({super.key});

  static final List<Widget> _pages = [
    _PlaceholderPage(title: LocaleKeys.home.tr()),
    _PlaceholderPage(title: LocaleKeys.offers.tr()),
    _PlaceholderPage(title: LocaleKeys.createOrder.tr()),
    _PlaceholderPage(title: LocaleKeys.orders.tr()),
    const MoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    return Scaffold(
      body: _pages[currentIndex.value],
      extendBody: true,
      floatingActionButton: NotchWidget(currentIndex: currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBarWidget(currentIndex: currentIndex),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Center(child: Text(title, style: TextStyle(fontSize: 24.sp))),
    );
  }
}
