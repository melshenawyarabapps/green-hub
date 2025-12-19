import 'package:flutter/cupertino.dart';

class NavigatorService{

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static get currentContext => navigatorKey.currentState?.context;


}