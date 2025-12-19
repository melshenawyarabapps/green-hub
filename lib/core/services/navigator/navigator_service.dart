import 'package:flutter/cupertino.dart';

class NavigatorService{

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentContext;


}