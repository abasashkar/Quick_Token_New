// import 'package:flutter/material.dart';

// class DoctorConfirmTab extends StatelessWidget {
//   const DoctorConfirmTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(12),
//       itemCount: 3,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           elevation: 3,
//           child: Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text("Patient Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

//                 const SizedBox(height: 6),
//                 const Text("Date: 22 Jan 2026"),
//                 const Text("Time: 11:00 AM"),
//                 const Text("Appointment No: APT1234"),

//                 const SizedBox(height: 10),

//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
//                   decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(6)),
//                   child: const Text(
//                     "Confirmed",
//                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
