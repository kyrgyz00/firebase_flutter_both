import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_both/dashboard_screen.dart';
import 'package:firebase_flutter_both/repository/authentication_repository/exception/signup_email_password_failure.dart';
import 'package:get/get.dart';

import '../../welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => DashBoardScreen());
  }

  Future<void> createWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const WelcomeScreen())
          : Get.to(() => DashBoardScreen());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION -${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("EXCEPTION -${ex.message}");
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
