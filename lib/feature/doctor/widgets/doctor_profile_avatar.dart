import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';

class DoctorProfileAvatar extends StatelessWidget {
  const DoctorProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 64,
          backgroundColor: Qcolors.primary,
          child: const Icon(Icons.person_outline, size: 72, color: Qcolors.primary),
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: Qcolors.primary,
          child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
        ),
      ],
    );
  }
}
