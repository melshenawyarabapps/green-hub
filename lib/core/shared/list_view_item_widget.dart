import 'package:flutter/material.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/enums/directional_enums.dart';
import 'package:gold/core/shared/card_widget.dart';
import 'package:gold/core/shared/text_image_widget.dart';
import 'package:gold/features/gold/presentation/views/widgets/change_widget.dart';
import 'package:gold/generated/assets.dart';

class ListViewItemWidget extends StatelessWidget {
  const ListViewItemWidget({super.key, required this.type});

  final CurrencyType type;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      borderColor: Theme.of(context).secondaryHeaderColor,
      child: Row(
        children: [
          const TextImageWidget(
            text: 'عيار 24',
            directionalType: DirectionalType.start,
            imagePath: Assets.testDemo,
          ),
          TextImageWidget(
            text: '395.40',
            directionalType: DirectionalType.end,
            imagePath: AppConfig.instance.appCurrency,
          ),
          TextImageWidget(
            text: '105.44',
            imagePath: Assets.iconsCurrencyDollar,
            isDollar: !type.isCurrency,
            showIcon:  !type.isCurrency,
          ),
          if (type.isGold) const ChangeWidget(),
        ],
      ),
    );
  }
}
