import 'package:flutter/material.dart';
import 'package:gold/core/shared/card_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.titles});

  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          for (int index = 0; index < titles.length; index++)
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
