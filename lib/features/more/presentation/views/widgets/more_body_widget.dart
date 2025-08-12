import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gold/core/shared/global_app_bar.dart';
import 'package:gold/core/utils/app_padding.dart';
import 'package:gold/features/more/presentation/controllers/more_controller.dart';
import 'package:gold/features/more/presentation/views/widgets/contact_us_widget.dart';
import 'package:gold/features/more/presentation/views/widgets/list_view_widget.dart';
import 'package:gold/features/more/presentation/views/widgets/note_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreBodyWidget extends StatefulWidget {
  const MoreBodyWidget({super.key});

  @override
  State<MoreBodyWidget> createState() => _MoreBodyWidgetState();
}

class _MoreBodyWidgetState extends State<MoreBodyWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MoreController>().getContacts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.instance.horizontalPadding(AppPadding.instance.p12),
      child: Column(
        children: [
          const GlobalAppBar(),
          Expanded(
            child: ListView(
              padding: AppPadding.instance.onlyPadding(
                bottom: AppPadding.instance.p48,
                top: AppPadding.instance.p48,
                start: AppPadding.instance.p12,
                end: AppPadding.instance.p12,
              ),
              children: [
                const ListViewWidget(),
                32.verticalSpace,
                const ContactUsWidget(),
                56.verticalSpace,
                const NoteWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
