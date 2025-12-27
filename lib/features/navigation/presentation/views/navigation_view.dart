import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/features/home/presentation/views/user_home_view.dart';
import 'package:greenhub/features/more/presentation/views/more_view.dart';
import 'package:greenhub/features/navigation/presentation/views/widgets/navigation_bar_widget.dart';
import 'package:greenhub/features/navigation/presentation/views/widgets/notch_widget.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  late List<Widget> _pages;
  late int currentIndex;

  @override
  void initState() {
    final isUser = AppConfig.instance.currentFlavor.isUser;
    if (isUser) {
      _pages = [
        const UserHomeView(),
        _PlaceholderPage(title: LocaleKeys.offers.tr()),
        _PlaceholderPage(title: LocaleKeys.createOrder.tr()),
        _PlaceholderPage(title: LocaleKeys.orders.tr()),
        const MoreView(),
      ];
    } else {
      _pages = [
        _PlaceholderPage(title: LocaleKeys.home.tr()),
        _PlaceholderPage(title: LocaleKeys.offers.tr()),
        _PlaceholderPage(title: LocaleKeys.createOrder.tr()),
        _PlaceholderPage(title: LocaleKeys.orders.tr()),
        const MoreView(),
      ];
    }
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      extendBody: true,
      floatingActionButton: NotchWidget(
        onTap: () {
          setState(() {
            currentIndex = 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBarWidget(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
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
