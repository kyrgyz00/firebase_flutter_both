import 'package:firebase_flutter_both/otp_screen.dart';
import 'package:firebase_flutter_both/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: controller.nickName,
              decoration: InputDecoration(
                labelText: 'Your name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              // onSaved: (value) => _confirmPassword = value.trim(),
            ),
            TextFormField(
              controller: controller.phoneNumber,
              decoration: InputDecoration(
                labelText: 'Phone number',
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              // onSaved: (value) => _confirmPassword = value.trim(),
            ),
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
              // onSaved: (value) => _email = value.trim(),
            ),
            TextFormField(
              controller: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              // onSaved: (value) => _password = value.trim(),
            ),
            // TextFormField(
            //   // controller: controller.password,
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     labelText: 'Confirm Password',
            //   ),
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please confirm your password';
            //     } else if (value != controller.password) {
            //       return 'Passwords do not match';
            //     }
            //     return null;
            //   },
            //   // onSaved: (value) => _confirmPassword = value.trim(),
            // ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    SignUpController.instance
                        .phoneAuntification(controller.phoneNumber.text.trim());
                    // _formKey.currentState!.save();
                    // SignUpController.instance.registerUser(
                    //     controller.email.text.trim(),
                    //     controller.password.text.trim());
                    Get.to(const OTPScreen());
                  }
                },
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
