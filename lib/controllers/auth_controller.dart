import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_token_new/models/user_model.dart';
import 'package:quick_token_new/services/auth_services.dart';
import 'package:quick_token_new/routes/routes_helper.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final box = GetStorage();
  UserModel? user;

  Future<void> register(String email, String password) async {
    try {
      print(email + password);
      isLoading.value = true;
      user = await AuthServices.register(email, password);
      if (user != null) {
        box.write('token', user!.token);
        Get.snackbar('Success', 'Registration Successful');
        Get.offAllNamed(RoutesHelper.homescreen);
      } else {
        Get.snackbar('Error', 'Registration failed. Try again.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      user = await AuthServices.login(email, password);
      if (user != null) {
        box.write('token', user!.token);
        Get.snackbar('Success', 'Login Successful');
        Get.offAllNamed(RoutesHelper.homescreen);
      } else {
        Get.snackbar('Error', 'Invalid email or password');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendOtp(String email) async {
    try {
      isLoading.value = true;
      bool otpsent = await AuthServices.sendOtp(email);
      if (otpsent) {
        Get.snackbar('succuess', 'OTP sent to $email');
        Get.toNamed(RoutesHelper.verifyOtp, arguments: {'email': email});
      } else {
        Get.snackbar('Error', 'Failed to send OTP. Try again.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    try {
      isLoading.value = true;
      user = await AuthServices.verifyOtp(email, otp);

      if (user != null) {
        box.write('token', user!.token);
        Get.snackbar('Success', 'OTP Verified Successfully');
        Get.toNamed(RoutesHelper.homescreen);
      } else {
        Get.snackbar('Error', 'Invalid OTP. Try again.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool get isLoggedIn => box.hasData('token');

  void logout() {
    box.erase();
    Get.offAllNamed('/login');
  }
}
