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
          radius: 70,
          backgroundColor: Qcolors.primary.withOpacity(0.1),
          child: const Icon(Icons.person, size: 80, color: Qcolors.primary),
        ),
        Container(
          decoration: const BoxDecoration(color: Qcolors.primary, shape: BoxShape.circle),
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}
