import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;

  BigText({
    super.key,
    this.color = Colors.white,
    required this.text,
    this.size = 32,
    this.height = 1.2,
    required TextOverflow overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: GoogleFonts.montserrat(
        color: Colors.white,
        height: height,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
      // style: TextStyle(
      //     fontSize: size,
      //     fontFamily: 'Roboto',
      //     color: color,
      //     height: height,
      //     fontWeight: FontWeight.w600),
    );
  }
}
