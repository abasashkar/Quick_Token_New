import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';

class DoctorHeaderCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String? imageUrl;

  const DoctorHeaderCard({super.key, required this.name, required this.specialization, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Qcolors.backgroundDark, blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
                ? NetworkImage(imageUrl!)
                : const AssetImage('assets/image.png') as ImageProvider,
          ),

          const SizedBox(width: 16),

          // Doctor Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87),
              ),
              const SizedBox(height: 6),
              Text(
                specialization,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
