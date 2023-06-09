import 'package:firebase_flutter_both/dashboard_screen.dart';
import 'package:firebase_flutter_both/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const DashBoardScreen()) : Get.back();
  }
}
