import 'package:firebase_flutter_both/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_flutter_both/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final nickName = TextEditingController();
  final phoneNumber = TextEditingController();

  // final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createWithEmailAndPassword(email, password);
  }

  // Future<void> createUser(UserModel user) async {
  //   await userRepo.createUser(user);
  // }
  void phoneAuntification(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }
}
