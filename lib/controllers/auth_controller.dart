// import 'package:get/get.dart';
// import 'package:quick_token_new/model/user_model.dart';
// import 'package:quick_token_new/routes/routes_helper.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class AuthController extends GetxController {
//   var isLoading = false.obs;
//   static const baseUrl = 'http://10.0.2.2:4000'; // CHANGE

//   // 🚀 Send OTP with role check
//   Future<void> sendOtp(String email, String role) async {
//     try {
//       isLoading.value = true;

//       final response = await http.post(
//         Uri.parse("$baseUrl/api/auth/send-otp"),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode({
//           "email": email,
//           "role": role, // patient / doctor / lab
//         }),
//       );

//       final data = json.decode(response.body);

//       if (response.statusCode == 200 && data["success"] == true) {
//         Get.snackbar("Success", "OTP sent to $email");
//       } else {
//         Get.snackbar(
//           "Error",
//           data["message"] ?? "Unable to send OTP",
//           backgroundColor: Get.theme.colorScheme.error,
//           colorText: Get.theme.colorScheme.onError,
//         );
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Something went wrong: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // 🚀 Verify OTP + Role Validation (VERY IMPORTANT)
//   Future<void> verifyOtp(String email, String otp, String selectedRole) async {
//     try {
//       isLoading.value = true;

//       final response = await http.post(
//         Uri.parse("$baseUrl/api/auth/verify-otp"),

//         headers: {"Content-Type": "application/json"},
//         body: json.encode({"email": email, "otp": otp, "role": selectedRole}),
//       );

//       final data = json.decode(response.body);

//       if (response.statusCode == 200 && data["success"] == true) {
//         final String returnedRole = data["role"];

//         // ❗ Prevent role misuse
//         if (returnedRole != selectedRole) {
//           Get.snackbar(
//             "Access Denied",
//             "This email is not registered as a $selectedRole",
//             backgroundColor: Get.theme.colorScheme.error,
//             colorText: Get.theme.colorScheme.onError,
//           );
//           return;
//         }

//         // UserModel updated with role
//         UserModel user = UserModel.fromJson(data);

//         // Navigate based on actual role
//         if (returnedRole == "doctor") {
//           Get.offAllNamed(RoutesHelper.doctorsHomeScreen);
//         } else if (returnedRole == "patient") {
//           Get.offAllNamed(RoutesHelper.patientsHomeScreen);
//         } else if (returnedRole == "lab") {
//           Get.offAllNamed(RoutesHelper.patientsHomeScreen);
//         }

//         Get.snackbar("Success", "OTP Verified");
//       } else {
//         Get.snackbar(
//           "Error",
//           data["message"] ?? "Invalid OTP",
//           backgroundColor: Get.theme.colorScheme.error,
//           colorText: Get.theme.colorScheme.onError,
//         );
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Something went wrong: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
