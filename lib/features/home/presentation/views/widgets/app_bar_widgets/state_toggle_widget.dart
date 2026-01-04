import 'package:flutter/material.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';

class StateToggleWidget extends StatefulWidget {
  const StateToggleWidget({super.key});

  @override
  State<StateToggleWidget> createState() => _StateToggleWidgetState();
}

class _StateToggleWidgetState extends State<StateToggleWidget> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isOnline,
      activeTrackColor: context.theme.primaryColor,
      inactiveTrackColor: context.theme.disabledColor,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      padding: EdgeInsets.zero,
      onChanged: (vale) {
        setState(() {
          isOnline = vale;
        });
      },
    );
  }
}
