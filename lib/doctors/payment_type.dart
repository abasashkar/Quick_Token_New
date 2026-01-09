// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/Recomendation/book_appointments.dart';
// import 'package:quick_token_new/doctors/bank_transfer.dart';
// import 'package:quick_token_new/doctors/creditcard_payment.dart';
// import 'package:quick_token_new/doctors/doctors_bio.dart';
// import 'package:quick_token_new/doctors/pay_pal.dart';
// import 'package:quick_token_new/doctors/qr_code.dart';
// import 'package:quick_token_new/widgets/arrow_back.dart';

// class PaymentMethodScreen extends StatelessWidget {
//   const PaymentMethodScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 34, 80, 120),
//         elevation: 0,
//         title: const Text(
//           "Payment",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         leading: IconButton(
//           icon: ArrowBackButton(
//             onTap: () {
//               navigator!.push(
//                 MaterialPageRoute(builder: (context) => DoctorsBio()),
//               );
//             },
//             iconSize: 19,
//           ),
//           onPressed: () {
//             Navigator.pop(context); // Or use Get.back() if using GetX
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Choose Payment Method",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 20),

//             // Credit Card
//             GestureDetector(
//               onTap: () {
//                 navigator?.push(
//                   MaterialPageRoute(
//                     builder: (context) => const CreditCardPaymentScreen(),
//                   ),
//                 );
//               },
//               child: _buildPaymentOption(
//                 icon: Icons.credit_card,
//                 label: "Credit Card",
//               ),
//             ),

//             // PayPal
//             GestureDetector(
//               onTap: () {
//                 navigator?.push(
//                   MaterialPageRoute(
//                     builder: (context) => const PayPalPaymentScreen(),
//                   ),
//                 );
//               },
//               child: _buildPaymentOption(
//                 icon: Icons.account_balance_wallet,
//                 label: "PayPal",
//               ),
//             ),

//             // Bank Transfer
//             GestureDetector(
//               onTap: () {
//                 navigator?.push(
//                   MaterialPageRoute(
//                     builder: (context) => const BankTransferScreen(),
//                   ),
//                 );
//               },
//               child: _buildPaymentOption(
//                 icon: Icons.account_balance,
//                 label: "Bank Transfer",
//               ),
//             ),

//             // QR Code
//             GestureDetector(
//               onTap: () {
//                 navigator!.push(
//                   MaterialPageRoute(
//                     builder: (context) => QRCodePaymentScreen(),
//                   ),
//                 );
//               },
//               child: _buildPaymentOption(
//                 icon: Icons.qr_code_2,
//                 label: "QR Code Payment",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentOption({required IconData icon, required String label}) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF6F6F6),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: const Color.fromARGB(255, 34, 80, 120)),
//           const SizedBox(width: 16),
//           Text(label, style: const TextStyle(fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }
