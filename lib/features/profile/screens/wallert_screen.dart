import 'package:flutter/material.dart';
import 'package:glide/core/widgets/custom_drawer.dart';
import 'package:glide/features/profile/widgets/wallet_screen_body.dart';

class WallertScreen extends StatelessWidget {
  const WallertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Glide Wallet'),
      ),
      endDrawer: const CustomDrawer(),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: WalletScreenBody(),
      ),
    );
  }
}
