import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindTrustedDoctors extends StatefulWidget {
  const FindTrustedDoctors({super.key});

  @override
  State<FindTrustedDoctors> createState() => _FindTrustedDoctorsState();
}

class _FindTrustedDoctorsState extends State<FindTrustedDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App logo and name
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
                    const SizedBox(width: 8),
                    Text(
                      'Quicktock',
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Illustration image
                Image.asset(
                  'assets/trusted_doctor.png', // Replace with your cropped/transparent image
                  height: 220,
                ),

                const SizedBox(height: 40),

                // Title
                Text(
                  "Find Trusted Doctors",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtitle
                Text(
                  "With the help of our intelligent algorithm, find the top rated doctors around your vicinity at total ease.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 40),

                // Next Button
                ElevatedButton(
                  onPressed: () {
                    // Handle navigation
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7F56D9),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [dot(true), dot(false), dot(false)],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dot widget
  Widget dot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF7F56D9) : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
