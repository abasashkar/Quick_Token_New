// import 'package:flutter/material.dart';

// class PendingTab extends StatelessWidget {
//   const PendingTab({super.key});

//   // 🔹 Mock pending appointments
//   final List<Map<String, String>> pendingAppointments = const [
//     {'patientName': 'John Doe', 'date': '2026-01-25', 'slot': '09:30 AM'},
//     {'patientName': 'Sarah Smith', 'date': '2026-01-26', 'slot': '11:00 AM'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     if (pendingAppointments.isEmpty) {
//       return const Center(child: Text("No pending appointments"));
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.all(12),
//       itemCount: pendingAppointments.length,
//       itemBuilder: (context, index) {
//         final appt = pendingAppointments[index];

//         return Container(
//           margin: const EdgeInsets.only(bottom: 16),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(color: const Color(0xFF4F8BFF), borderRadius: BorderRadius.circular(18)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 appt['patientName']!,
//                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//               const SizedBox(height: 8),
//               Text("${appt['date']} | ${appt['slot']}", style: const TextStyle(color: Colors.white70)),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
