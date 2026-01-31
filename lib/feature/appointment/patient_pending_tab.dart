// import 'package:flutter/material.dart';
// import 'package:quick_token_new/core/design/shared/colors.dart';

// class PendingTab extends StatelessWidget {
//   const PendingTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(12),
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Container(
//           margin: const EdgeInsets.only(bottom: 16),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(color: const Color(0xFF4F8BFF), borderRadius: BorderRadius.circular(18)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Patient Name",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//               const SizedBox(height: 8),
//               const Text("22 Jan 2026 | 11:00 AM", style: TextStyle(color: Colors.white70)),
//               const SizedBox(height: 12),

//               Row(
//                 children: [
//                   OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
//                     child: const Text("Cancel"),
//                   ),
//                   const SizedBox(width: 12),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Qcolors.backgroundLight,
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text("Accept"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
