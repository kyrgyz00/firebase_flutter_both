import 'package:firebase_flutter_both/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ведите код"),
            OtpTextField(
              numberOfFields: 6,
              filled: true,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("tnext"),
            )
            //  Text("password"),
            // TextFormField(),
          ],
        ),
      ),
    );
  }
}
