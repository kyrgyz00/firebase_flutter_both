import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome screen"),
            ElevatedButton(
              onPressed: () {},
              child: Text("LOg in"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SignUpScreen());
              },
              child: Text("sign in in"),
            )
          ],
        ),
      ),
    );
  }
}
