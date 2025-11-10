import 'package:flutter/material.dart';

class ExtraSmallText extends StatelessWidget {
  final Color? color; // now nullable
  final String text;
  final double size;
  final double height;
  final int? maxLines;
  final TextOverflow overFlow;

  const ExtraSmallText({
    super.key,
    this.color, // no default color to allow inheritance
    required this.text,
    this.size = 13,
    this.height = 1.3,
    this.maxLines,
    this.overFlow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overFlow,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Roboto',
        color: color ?? DefaultTextStyle.of(context).style.color,
        height: height,
      ),
    );
  }
}
