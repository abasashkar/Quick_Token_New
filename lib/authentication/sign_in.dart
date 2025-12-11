// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:quick_token_new/authentication/sign_up.dart';
// import 'package:quick_token_new/authentication/verification_code.dart';
// import 'package:quick_token_new/controllers/auth_controller.dart';
// import 'package:quick_token_new/widgets/big_text.dart';
// import 'package:quick_token_new/widgets/extra_small_text.dart';
// import 'package:quick_token_new/widgets/small_text.dart';
// import 'package:quick_token_new/widgets/textform_widget.dart';
// import 'package:quick_token_new/widgets/welcome_back_text.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final authController = Get.put(AuthController());

//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Logo and App Name
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.asset(
//                         'assets/quick_token.png',
//                         width: 38,
//                         height: 43,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     Text(
//                       'Quicktock',
//                       style: GoogleFonts.poppins(
//                         fontSize: 21,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 60),

//                 // Welcome Text
//                 const Center(child: WelcomeBackText(text: 'Welcome Back!')),

//                 const SizedBox(height: 10),

//                 // Email Hint Text
//                 Center(
//                   child: SmallText(
//                     text: 'Use your credentials to access your account',
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 // Email TextFormField
//                 TextFormWidget(
//                   hintText: 'Enter your email',
//                   controller: emailController,
//                 ),

//                 const SizedBox(height: 20),

//                 // Password TextFormField
//                 TextFormWidget(
//                   hintText: 'Enter your password',
//                   suffixIcon: Icons.remove_red_eye_outlined,
//                   obscureText: true,
//                   controller: passwordController,
//                 ),

//                 const SizedBox(height: 10),

//                 // Checkbox and Labels
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: isChecked,
//                       onChanged: (bool? newValue) {
//                         setState(() {
//                           isChecked = newValue ?? false;
//                         });
//                       },
//                       activeColor: const Color(0xFF7F56D9),
//                       checkColor: Colors.white,
//                       fillColor: MaterialStateProperty.all(
//                         const Color(0xFF7F56D9),
//                       ),
//                     ),
//                     const ExtraSmallText(
//                       text: 'Remember me',
//                       color: Colors.grey,
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(() => const VerificationCode());
//                       },
//                       child: const ExtraSmallText(
//                         text: 'Forgot password?',
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 50),

//                 // Login Button
//                 Obx(() {
//                   return GestureDetector(
//                     onTap: authController.isLoading.value
//                         ? null
//                         : () {
//                             authController.login(
//                               emailController.text.trim(),
//                               passwordController.text.trim(),
//                             );
//                           },
//                     child: Center(
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 140,
//                           vertical: 14,
//                         ),
//                         decoration: BoxDecoration(
//                           color: authController.isLoading.value
//                               ? Colors.grey
//                               : const Color(0xFF7F56D9),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: authController.isLoading.value
//                             ? const CircularProgressIndicator(
//                                 color: Colors.white,
//                               )
//                             : const Text(
//                                 'Login',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                       ),
//                     ),
//                   );
//                 }),

//                 const SizedBox(height: 30),

//                 // SignUp Link
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SmallText(
//                       size: 14,
//                       text: 'New user? register your account ',
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(() => const SignUp());
//                       },
//                       child: BigText(
//                         text: 'Sign Up',
//                         overflow: TextOverflow.ellipsis,
//                         color: Color(0xFF7F56D9),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
