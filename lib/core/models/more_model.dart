import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MoreModel extends Equatable{
  final String title;
  final String icon;
  final GestureTapCallback? onPressed;
  const MoreModel({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  List<Object?> get props => [title, icon];

}