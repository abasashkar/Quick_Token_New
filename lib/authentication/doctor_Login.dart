// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/authentication/create_doctor_account.dart';
// import 'package:quick_token_new/controllers/auth_controller.dart';
// import 'package:quick_token_new/routes/routes_helper.dart';
// import 'package:quick_token_new/widgets/custom_appbar.dart';
// import 'package:quick_token_new/widgets/extra_small_text.dart';

// class DoctorLogin extends StatefulWidget {
//   const DoctorLogin({super.key});

//   @override
//   State<DoctorLogin> createState() => _DoctorLoginState();
// }

// class _DoctorLoginState extends State<DoctorLogin> {
//   final TextEditingController emailController = TextEditingController();
//   final AuthController authController = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 230, 230, 230),
//       appBar: CustomAppBar(
//         icon: const Icon(Icons.menu, color: Colors.white),
//         title: ExtraSmallText(
//           text: 'Doctor Login',
//           size: 20,
//           color: Colors.white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             Center(
//               child: ExtraSmallText(
//                 text: 'Please Enter Your Email Address',
//                 size: 20,
//                 color: Colors.black,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
//               child: ExtraSmallText(
//                 text:
//                     'We need to verify your Email Address.\nWe will send an OTP (One Time Password) to the email account you enter below.',
//                 size: 16,
//                 color: Colors.black,
//                 maxLines: 3,
//                 overFlow: TextOverflow.ellipsis,
//               ),
//             ),
//             const SizedBox(height: 50),

//             // Email TextField
//             Container(
//               width: 335,
//               child: TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   hintStyle: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w300,
//                     color: Colors.grey,
//                   ),
//                   prefixIcon: const Icon(Icons.email, size: 30),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 14.0,
//                     horizontal: 16,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(18),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ExtraSmallText(
//                   text: "If you don't have an account?",
//                   color: Colors.black,
//                   size: 15,
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     navigator!.push(
//                       MaterialPageRoute(
//                         builder: (context) => CreateDoctorAccount(),
//                       ),
//                     );
//                   },
//                   child: const Text('Create Account'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),

//             // Next Button
//             Obx(() {
//               return GestureDetector(
//                 onTap: authController.isLoading.value
//                     ? null
//                     : () {
//                         final email = emailController.text.trim();
//                         if (email.isEmpty || !email.contains('@')) {
//                           Get.snackbar(
//                             'Error',
//                             'Please enter a valid email address',
//                             backgroundColor: Colors.redAccent,
//                             colorText: Colors.white,
//                           );
//                           return;
//                         }
//                         // Send OTP and navigate to verify screen
//                         authController.sendOtp(email).then((_) {
//                           Get.toNamed(
//                             RoutesHelper.getVerifyOtp(),
//                             arguments: {'email': email},
//                           );
//                         });
//                       },
//                 child: Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF4F8BFF),
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                   child: authController.isLoading.value
//                       ? const Center(
//                           child: CircularProgressIndicator(color: Colors.white),
//                         )
//                       : const Icon(
//                           Icons.navigate_next,
//                           size: 60,
//                           color: Colors.white,
//                         ),
//                 ),
//               );
//             }),
//             const SizedBox(height: 10),
//             Center(
//               child: ExtraSmallText(
//                 text: 'Next',
//                 size: 22,
//                 color: Colors.black,
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
import 'package:quick_token_new/authentication/create_doctor_account.dart';
import 'package:quick_token_new/controllers/auth_controller.dart';
import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  final TextEditingController emailController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: CustomAppBar(
        icon: const Icon(Icons.menu, color: Colors.white),
        title: ExtraSmallText(
          text: 'Doctor Login',
          size: 20,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: ExtraSmallText(
                text: 'Please Enter Your Email Address',
                size: 20,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: ExtraSmallText(
                text:
                    'We need to verify your Email Address.\nWe will send an OTP (One Time Password) to the email account you enter below.',
                size: 16,
                color: Colors.black,
                maxLines: 3,
                overFlow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 50),

            // Email TextField
            Container(
              width: 335,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  prefixIcon: const Icon(Icons.email, size: 30),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExtraSmallText(
                  text: "If you don't have an account?",
                  color: Colors.black,
                  size: 15,
                ),
                TextButton(
                  onPressed: () {
                    navigator!.push(
                      MaterialPageRoute(
                        builder: (context) => CreateDoctorAccount(),
                      ),
                    );
                  },
                  child: const Text('Create Account'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Next Button
            Obx(() {
              return GestureDetector(
                onTap: authController.isLoading.value
                    ? null
                    : () {
                        final email = emailController.text.trim();

                        if (email.isEmpty || !email.contains('@')) {
                          Get.snackbar(
                            'Error',
                            'Please enter a valid email address',
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white,
                          );
                          return;
                        }

                        // Send OTP with Doctor role
                        authController.sendOtp(email, "doctor").then((_) {
                          Get.toNamed(
                            RoutesHelper.getVerifyOtp(),
                            arguments: {'email': email, 'role': 'doctor'},
                          );
                        });
                      },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4F8BFF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: authController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Icon(
                          Icons.navigate_next,
                          size: 60,
                          color: Colors.white,
                        ),
                ),
              );
            }),

            const SizedBox(height: 10),
            Center(
              child: ExtraSmallText(
                text: 'Next',
                size: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
