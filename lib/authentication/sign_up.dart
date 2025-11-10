import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_token_new/authentication/sign_in.dart';
import 'package:quick_token_new/controllers/auth_controller.dart';
import 'package:quick_token_new/widgets/small_text.dart';
import 'package:quick_token_new/widgets/textform_widget.dart';
import 'package:quick_token_new/widgets/welcome_back_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = Get.put(AuthController());
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/quick_token.png',
                        width: 38,
                        height: 43,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Quicktock',
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 60),
                const Center(child: WelcomeBackText(text: 'Sign Up')),
                const SizedBox(height: 10),
                Center(
                  child: SmallText(
                    overflow: TextOverflow.ellipsis,
                    text: 'Create your account to get started',
                  ),
                ),

                const SizedBox(height: 30),

                // Email
                TextFormWidget(
                  hintText: 'Enter your Email',
                  controller: emailController,
                ),

                const SizedBox(height: 10),

                // Password
                TextFormWidget(
                  hintText: 'Enter your Password',
                  controller: passwordController,
                  obscureText: true,
                  suffixIcon: Icons.remove_red_eye_outlined,
                ),

                const SizedBox(height: 50),

                // Register Button
                Obx(() {
                  return GestureDetector(
                    onTap: authController.isLoading.value
                        ? null
                        : () {
                            authController.register(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          },
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 140,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: authController.isLoading.value
                              ? Colors.grey
                              : const Color(0xFF7F56D9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: authController.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 30),

                // Already have account
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginPage());
                    },
                    child: SmallText(
                      overflow: TextOverflow.ellipsis,
                      text: 'Already have an account? Sign In',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
