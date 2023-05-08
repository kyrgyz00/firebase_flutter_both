import 'package:firebase_flutter_both/models/user_model.dart';
import 'package:firebase_flutter_both/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("profile"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;

                  final email = TextEditingController(text: user.email);
                  final password = TextEditingController(text: user.password);
                  final nickName = TextEditingController(text: user.nickName);
                  final phoneNumber =
                      TextEditingController(text: user.phoneNumber);
                  return Column(
                    children: [
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: nickName,
                            initialValue: user.nickName,
                            decoration: const InputDecoration(
                              labelText: 'Your name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            initialValue: user.phoneNumber,
                            controller: phoneNumber,
                            decoration: const InputDecoration(
                              labelText: 'Phone number',
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            initialValue: user.email,
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            initialValue: user.password,
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final userData = UserModel(
                                    nickName: nickName.text.trim(),
                                    email: email.text.trim(),
                                    phoneNumber: phoneNumber.text.trim(),
                                    password: password.text.trim());

                                await controller.updateRecord(userData);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text('edit profile'),
                            ),
                          ),
                        ],
                      ))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
            },
          ),
        ),
      ),
    );
  }
}
