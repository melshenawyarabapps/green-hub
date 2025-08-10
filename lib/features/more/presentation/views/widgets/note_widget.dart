import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gold/core/utils/font_sizes.dart';
import 'package:gold/core/utils/font_weights.dart';
import 'package:gold/translations/locale_keys.g.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.importantNote.tr(),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: FontSizes.instance.s15,
        fontWeight: FontWeights.instance.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
