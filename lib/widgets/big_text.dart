import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;

  const BigText({super.key, this.color = Colors.black, required this.text, this.size = 32, this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: GoogleFonts.montserrat(color: Colors.black, height: height, fontSize: size, fontWeight: FontWeight.w700),
    );
  }
}
