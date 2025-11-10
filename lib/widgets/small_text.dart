import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;

  SmallText(
      {super.key,
      this.color = Colors.black45,
      required this.text,
      this.size = 14,
      this.height = 1.2,
      required TextOverflow overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
          fontSize: size, fontFamily: 'Roboto', color: color, height: height),
    );
  }
}
