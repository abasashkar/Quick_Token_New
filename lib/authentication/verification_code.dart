import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quick_token_new/widgets/small_text.dart';
import 'package:quick_token_new/widgets/welcome_back_text.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
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
                // Logo and App Name
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

                // Welcome Text
                const Center(child: WelcomeBackText(text: 'Welcome Back!')),

                const SizedBox(height: 10),

                // Instructional Text
                Center(
                  child: SmallText(
                    text:
                        'Enter the 4-digit verification code that you received in\n',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Center(
                  child: SmallText(
                    text: 'your email',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height: 30),

                // Pin Code Input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 60,
                      fieldWidth: 60,
                      activeColor: const Color(0xFF7F56D9),
                      selectedColor: const Color(0xFF7F56D9),
                      inactiveColor: const Color(0xFF7F56D9).withOpacity(0.3),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    onChanged: (value) {},
                  ),
                ),

                const SizedBox(height: 2),

                // Correctly placed image
                Center(
                  child: Image.asset(
                    'assets/verification_image.png', // Your actual image path
                    width: 280,
                    height: 240,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 35),

                // Continue Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add navigation logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7F56D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 140,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
