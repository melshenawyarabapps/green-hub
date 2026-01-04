import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';

import '../../../../../../generated/assets.dart';

class SelectDateWidget extends StatefulWidget {
  const SelectDateWidget({super.key, this.onDateTimeSelected});

  final void Function(DateTime? dateTime)? onDateTimeSelected;

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDateTime;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );

    if (pickedDate != null && mounted) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
      );

      if (pickedTime != null && mounted) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _controller.text = DateFormat(
            'yyyy/MM/dd - hh:mm a',
            context.locale.languageCode,
          ).format(_selectedDateTime!);
        });
        widget.onDateTimeSelected?.call(_selectedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.date.tr(),
          style: context.textTheme.headlineSmall,
        ),
        16.verticalSpace,
        AppTextFormField(
          controller: _controller,
          readOnly: true,
          onTap: _pickDateTime,
          hintText: LocaleKeys.selectDate.tr(),
          suffixIcon: Padding(
            padding: AppPadding.verticalPadding(
              12.h,
            ),
            child: const CustomSvgBuilder(
              path: Assets.svgsCalendar,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
