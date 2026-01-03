import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/custom_drop_down_menu.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/custom_radio_button.dart';

class TypeOfTransportWidget extends StatelessWidget {
  const TypeOfTransportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          LocaleKeys.typeOfTransport.tr(),
          style: context.textTheme.headlineSmall,
        ),
        CustomDropdownWidget<String>(
          itemLabelBuilder: (item) => item,
          hint: LocaleKeys.selectTypeOfTransport.tr(),
          items: const [
            'Option 1',
            'Option 2',
            'Option 3',
          ],
        ),
        Row(
          spacing: 20,
          children: [
            CustomRadioButton(
              isSelected: true,
              label: LocaleKeys.installation.tr(),
              onChanged: () {},
            ),
            CustomRadioButton(
              isSelected: false,
              label: LocaleKeys.load.tr(),
              onChanged: () {},
            ),
          ],
        ),
      ],
    );
  }
}
