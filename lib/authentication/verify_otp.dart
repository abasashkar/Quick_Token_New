// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/controllers/auth_controller.dart';
// import 'package:quick_token_new/widgets/extra_small_text.dart';

// class VerifyOtpScreen extends StatelessWidget {
//   const VerifyOtpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AuthController authController = Get.find<AuthController>();
//     final TextEditingController otpController = TextEditingController();
//     final String email =
//         Get.arguments['email']; // Email passed from previous screen

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 230, 230, 230),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF4F8BFF),
//         centerTitle: true,
//         title: const Text(
//           "Verify OTP",
//           style: TextStyle(
//             fontSize: 22,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.verified_user,
//               color: Color(0xFF4F8BFF),
//               size: 100,
//             ),
//             const SizedBox(height: 25),
//             ExtraSmallText(
//               text: "Enter the 6-digit OTP sent to:",
//               size: 18,
//               color: Colors.black,
//             ),
//             const SizedBox(height: 5),
//             ExtraSmallText(text: email, size: 17, color: Colors.black87),
//             const SizedBox(height: 40),

//             // OTP Input Field
//             Container(
//               width: 200,
//               child: TextField(
//                 controller: otpController,
//                 keyboardType: TextInputType.number,
//                 textAlign: TextAlign.center,
//                 maxLength: 6,
//                 style: const TextStyle(
//                   fontSize: 22,
//                   letterSpacing: 5,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: "Enter OTP",
//                   counterText: "",
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 16,
//                     horizontal: 12,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(18),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),

//             // Verify Button
//             Obx(() {
//               return ElevatedButton(
//                 onPressed: authController.isLoading.value
//                     ? null
//                     : () {
//                         final otp = otpController.text.trim();
//                         if (otp.isEmpty || otp.length != 6) {
//                           Get.snackbar(
//                             'Error',
//                             'Please enter a valid 6-digit OTP',
//                             backgroundColor: Colors.redAccent,
//                             colorText: Colors.white,
//                           );
//                           return;
//                         }
//                         authController.verifyOtp(email, otp);
//                       },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4F8BFF),
//                   minimumSize: const Size(double.infinity, 55),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//                 child: authController.isLoading.value
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text(
//                         "Verify OTP",
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//               );
//             }),

//             const SizedBox(height: 20),

//             // Resend OTP Option
//             TextButton(
//               onPressed: () {
//                 authController.sendOtp(email);
//                 Get.snackbar(
//                   "OTP Sent",
//                   "A new OTP has been sent to $email",
//                   backgroundColor: Colors.blueAccent,
//                   colorText: Colors.white,
//                 );
//               },
//               child: const Text(
//                 "Resend OTP",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF4F8BFF),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/controllers/auth_controller.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final TextEditingController otpController = TextEditingController();

    // Getting email + role from previous screen
    final String email = Get.arguments['email'];
    final String role = Get.arguments['role']; // patient / doctor / lab

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F8BFF),
        centerTitle: true,
        title: const Text(
          "Verify OTP",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.verified_user,
              color: Color(0xFF4F8BFF),
              size: 100,
            ),
            const SizedBox(height: 25),
            ExtraSmallText(
              text: "Enter the 6-digit OTP sent to:",
              size: 18,
              color: Colors.black,
            ),
            const SizedBox(height: 5),
            ExtraSmallText(text: email, size: 17, color: Colors.black87),
            const SizedBox(height: 8),
            ExtraSmallText(
              text: "Role: $role",
              size: 16,
              color: Colors.black87,
            ),
            const SizedBox(height: 40),

            // OTP Input
            SizedBox(
              width: 200,
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                style: const TextStyle(
                  fontSize: 22,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                  counterText: "",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Verify Button
            Obx(() {
              return ElevatedButton(
                onPressed: authController.isLoading.value
                    ? null
                    : () {
                        final otp = otpController.text.trim();
                        if (otp.length != 6) {
                          Get.snackbar(
                            'Error',
                            'Please enter a valid 6-digit OTP',
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white,
                          );
                          return;
                        }

                        // Now includes role
                        authController.verifyOtp(email, otp, role);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F8BFF),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: authController.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Verify OTP",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              );
            }),

            const SizedBox(height: 20),

            // Resend OTP
            TextButton(
              onPressed: () {
                authController.sendOtp(email, role);
                Get.snackbar(
                  "OTP Sent",
                  "A new OTP has been sent to $email",
                  backgroundColor: Colors.blueAccent,
                  colorText: Colors.white,
                );
              },
              child: const Text(
                "Resend OTP",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4F8BFF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
