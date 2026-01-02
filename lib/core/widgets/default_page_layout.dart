import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/core/widgets/custom_back_button_widget.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/register_form_container.dart';

class DefaultPageLayout extends StatelessWidget {
  const DefaultPageLayout({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.action,
    required this.child,
    this.bottomSheet,
  });

  final Widget child;
  final String title;
  final bool showBackButton;
  final Widget? action;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    final height =
        (context.screenHeight) -
        context.topPadding -
        kToolbarHeight -
        54.h +
        (isKeyboardOpen ? 42.h : 0);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      bottomSheet: bottomSheet,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          title,
          style: context.textTheme.headlineLarge,
        ),
        leadingWidth: 86,
        leading: showBackButton ? const CustomBackButtonWidget() : null,
        actions: [
          if (action != null) action!,
        ],
      ),
      body: SizedBox(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned.fill(child: AppGradientWidget()),
            RegisterFormContainer(
              height: height,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
