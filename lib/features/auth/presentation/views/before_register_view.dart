import 'package:flutter/material.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/features/before_auth/presentation/views/widgets/bar_widget.dart';
import 'package:greenhub/features/before_auth/presentation/views/widgets/company_questions_widget.dart';
import 'package:greenhub/features/before_auth/presentation/views/widgets/image_in_widget.dart';
import 'package:greenhub/features/before_auth/presentation/views/widgets/image_out_widget.dart';
import 'package:greenhub/features/before_auth/presentation/views/widgets/question_widget.dart';

class BeforeRegisterView extends StatelessWidget {
  const BeforeRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AppGradientWidget()),
          const ImageInWidget(),
          const ImageOutWidget(),
          const BarWidget(),
          const QuestionWidget(child: CompanyQuestionsWidget()),
        ],
      ),
    );
  }
}
