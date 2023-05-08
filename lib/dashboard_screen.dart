import 'package:firebase_flutter_both/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(WelcomeScreen());
            }),
      ),
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
