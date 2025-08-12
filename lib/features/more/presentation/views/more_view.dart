import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold/core/services/di/di.dart';

import 'package:gold/features/more/presentation/controllers/more_controller.dart';
import 'package:gold/features/more/presentation/views/widgets/more_body_widget.dart';


class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<MoreController>(),
      child: const MoreBodyWidget(),
    );
  }
}
