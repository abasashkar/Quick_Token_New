import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final double iconSize;
  final double circleSize;

  const ArrowBackButton({
    Key? key,
    required this.onTap,
    this.iconSize = 20,
    this.circleSize = 36, // smaller circle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back,
          size: iconSize,
          color: Colors.black,
        ),
      ),
    );
  }
}
