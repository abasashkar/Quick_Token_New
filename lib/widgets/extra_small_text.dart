import 'package:flutter/material.dart';

class ExtraSmallText extends StatelessWidget {
  final Color? color;
  final TextStyle? style; // ✅ TextStyle
  final String text;
  final double? size;
  final double height;
  final int? maxLines;
  final TextOverflow overFlow;

  const ExtraSmallText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.size,
    this.height = 1.3,
    this.maxLines,
    this.overFlow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? const TextStyle();

    return Text(
      text,
      maxLines: maxLines,
      overflow: overFlow,
      style: baseStyle.copyWith(color: color ?? baseStyle.color, fontSize: size ?? baseStyle.fontSize, height: height),
    );
  }
}
