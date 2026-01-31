// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/doctors/payment_succuess.dart';

// class QRCodePaymentScreen extends StatefulWidget {
//   const QRCodePaymentScreen({super.key});

//   @override
//   State<QRCodePaymentScreen> createState() => _QRCodePaymentScreenState();
// }

// class _QRCodePaymentScreenState extends State<QRCodePaymentScreen> {
//   final amountController = TextEditingController();
//   String qrData = "";

//   @override
//   void dispose() {
//     amountController.dispose();
//     super.dispose();
//   }

//   void generateQRCode() {
//     setState(() {
//       qrData = amountController.text.trim();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "QR Code Payment",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color.fromARGB(255, 34, 80, 120),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.red),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Enter Amount",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: amountController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: "Amount",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 14,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//                 onPressed: generateQRCode,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 34, 80, 120),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   "Generate QR Code",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             if (qrData.isNotEmpty) ...[
//               const Text("Scan this QR Code", style: TextStyle(fontSize: 16)),
//               const SizedBox(height: 12),
//               Center(
//                 child: QrImageView(
//                   data: qrData,
//                   size: 200,
//                   backgroundColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Get.snackbar(
//                       "Sent",
//                       "Payment of ₹$qrData initiated",
//                       backgroundColor: Colors.green.shade100,
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 34, 80, 120),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       navigator!.push(
//                         MaterialPageRoute(
//                           builder: (context) => PaymentSuccessScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Send Now",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
