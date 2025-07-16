import 'package:flutter/material.dart';
import 'package:gold/core/shared/empty_widget.dart';
import 'package:gold/core/shared/loading_widget.dart';

class LoadingEmptyWidget extends StatelessWidget {
  const LoadingEmptyWidget({super.key, this.isLoading = false});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading ? const LoadingWidget() : const EmptyWidget(),
    );
  }
}
