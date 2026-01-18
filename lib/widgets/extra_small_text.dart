import 'package:flutter/material.dart';

class ExtraSmallText extends StatelessWidget {
  final Color? color;
  final TextStyle? style;
  final String text;
  final double? size;
  final double height;
  final int? maxLines;
  final TextOverflow overFlow;
  final TextAlign? textAlign; // ✅ NEW (optional)

  const ExtraSmallText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.size,
    this.height = 1.3,
    this.maxLines,
    this.overFlow = TextOverflow.clip,
    this.textAlign, // ✅ optional
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? const TextStyle();

    return Text(
      text,
      maxLines: maxLines,
      overflow: overFlow,
      textAlign: textAlign, // ✅ applied
      style: baseStyle.copyWith(
        color: color ?? baseStyle.color,
        fontSize: size ?? baseStyle.fontSize,
        height: height,
      ),
    );
  }
}
