import 'package:flutter/material.dart';
import 'package:greenhub/features/home/presentation/views/widgets/home_app_bar.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 240.0,
          backgroundColor: Colors.red,
          flexibleSpace: HomeAppBar(
            isUser: true,
          ),
        ),
        // Additional slivers can be added here
      ],
    );
  }
}
