import 'package:firebase_flutter_both/models/user_model.dart';
import 'package:firebase_flutter_both/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_flutter_both/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error ProfileControllerScreen", "Login to continue");
    }
  }

  Future<List<UserModel>> getAllUser() async => await _userRepo.allUser();
  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
