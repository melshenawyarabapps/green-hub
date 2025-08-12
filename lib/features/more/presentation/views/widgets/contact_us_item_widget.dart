import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/other_enums.dart';
import 'package:gold/core/utils/functions.dart';
import 'package:gold/features/more/data/models/contact_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsItemWidget extends StatelessWidget {
  const ContactUsItemWidget({super.key, required this.model});

  final ContactModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          openUrl(model.url, mode: LaunchMode.externalApplication);
        },
        child: Image.asset(model.type.image, height: 40.h),
      ),
    );
  }
}
