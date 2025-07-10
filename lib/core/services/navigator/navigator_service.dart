import 'package:flutter/material.dart';

abstract class NavigatorService{

  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();


  static BuildContext? get getContext => navigatorKey.currentContext;
  static GlobalKey<NavigatorState> get navigatorKey=> _navigatorKey;


}