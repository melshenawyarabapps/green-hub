import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';

class ConfirmationWidget extends StatefulWidget {
  const ConfirmationWidget({super.key});

  @override
  State<ConfirmationWidget> createState() => _ConfirmationWidgetState();
}

class _ConfirmationWidgetState extends State<ConfirmationWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? context.theme.primaryColor : context.theme.disabledColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child:
                  selected
                      ? Icon(
                        Icons.check,
                        size: 16,
                        color: context.theme.primaryColor,
                      )
                      : const SizedBox(
                        width: 16,
                        height: 16,
                      ),
            ),
          ),
        ),
        10.horizontalSpace,
        Text(
          LocaleKeys.byClickingOnPaymentYouAgreeToTheTermsAndConditions.tr(),
          style: context.textTheme.displaySmall,
        ),
      ],
    );
  }
}
