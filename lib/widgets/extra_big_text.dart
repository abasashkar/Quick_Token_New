import 'package:flutter/material.dart';

class ExtraBigText extends StatelessWidget {
  final Color? color;
  //? means optional may pass the colour or may not pass the colour
  final String text;
  final double size;
  final TextOverflow overflow;

  ExtraBigText({
    super.key,
    this.color = Colors.white,
    required this.text,
    this.size = 18,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
