import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBackText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double letterSpacing;

  const WelcomeBackText({
    super.key,
    this.color = Colors.black,
    required this.text,
    this.size = 24,
    this.height = 1.5,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.w600,
    this.letterSpacing = 0.2, // Slight spacing to enhance visual clarity
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
