import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/add_address_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/additional_notes_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/create_order_container.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/load_shipment_image.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/select_date_widget.dart'
    show SelectDateWidget;
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/shipment_details_widget.dart';
import 'package:greenhub/features/make_order/presentation/views/widgets/create_order_widgets/type_of_transport_widget.dart';

class CreateNewOrderBody extends StatelessWidget {
  const CreateNewOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CreateOrderContainer(
          child: TypeOfTransportWidget(),
        ),
        16.verticalSpace,
        const CreateOrderContainer(
          child: ShipmentDetailsWidget(),
        ),
        16.verticalSpace,
        const CreateOrderContainer(
          child: AddAddressWidget(),
        ),
        16.verticalSpace,
        const CreateOrderContainer(
          child: LoadShipmentImage(),
        ),
        16.verticalSpace,
        const CreateOrderContainer(
          child: AdditionalNotesWidget(),
        ),
        16.verticalSpace,
        const CreateOrderContainer(
          child: SelectDateWidget(),
        ),
      ],
    );
  }
}
