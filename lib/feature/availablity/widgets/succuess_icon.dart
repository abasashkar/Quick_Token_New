import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Qcolors.success),
      child: Center(
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          child: const Icon(Icons.check_rounded, size: 40, color: Colors.white),
        ),
      ),
    );
  }
}
