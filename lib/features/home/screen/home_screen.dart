import 'package:flutter/material.dart';
import 'package:glide/core/widgets/custom_app_bar.dart';
import 'package:glide/features/home/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: HomeBody(),
    );
  }
}
