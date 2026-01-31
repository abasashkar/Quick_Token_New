import 'package:flutter/material.dart';

class QTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;

  const QTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,

        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,

        // ✅ THIS IS THE REAL FIX
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black, // 🔥 REQUIRED
        ),

        cursorColor: Colors.blue,
        cursorHeight: 20,
        cursorWidth: 2,

        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),

          prefixIcon: prefixIcon ?? const Icon(Icons.email_outlined),

          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
