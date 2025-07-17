import 'package:flutter/material.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/enums/directional_enums.dart';
import 'package:gold/core/shared/card_widget.dart';
import 'package:gold/core/shared/text_image_widget.dart';
import 'package:gold/features/base/data/models/base_model.dart';
import 'package:gold/features/gold/presentation/views/widgets/change_widget.dart';
import 'package:gold/generated/assets.dart';

class ListViewItemWidget extends StatelessWidget {
  const ListViewItemWidget({
    super.key,
    required this.type,
    required this.model,
  });

  final CurrencyType type;
  final BaseModel model;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      borderColor: Theme.of(context).secondaryHeaderColor,
      child: Row(
        children: [
          TextImageWidget(
            text: model.name,
            directionalType: DirectionalType.start,
            imagePath: model.icon,
          ),
          TextImageWidget(
            text: model.basePrice,
            directionalType: DirectionalType.end,
            imagePath: AppConfig.instance.appCurrency,
          ),
          TextImageWidget(
            text: model.dollarPrice,
            imagePath: Assets.iconsCurrencyDollar,
            isDollar: !type.isCurrency,
            showIcon: !type.isCurrency,
          ),
          if (type.isGold)
            ChangeWidget(
              isUp: model.statusPrice == 'up',
              price: model.changeAmount,
            ),
        ],
      ),
    );
  }
}
