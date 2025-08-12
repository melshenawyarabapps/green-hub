import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/features/more/data/models/contact_model.dart';
import 'package:gold/features/more/presentation/controllers/more_controller.dart';
import 'package:gold/features/more/presentation/views/widgets/contact_us_item_widget.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MoreController, MoreState, List<ContactModel>>(
      selector: (state) => state.contacts,
      builder: (_, contacts) {
        return SizedBox(
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < contacts.length; index++)
                ContactUsItemWidget(model: contacts[index]),
            ],
          ),
        );
      },
    );
  }
}
