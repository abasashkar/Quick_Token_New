// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/doctors/payment_succuess.dart';

// class PayPalPaymentScreen extends StatefulWidget {
//   const PayPalPaymentScreen({super.key});

//   @override
//   State<PayPalPaymentScreen> createState() => _PayPalPaymentScreenState();
// }

// class _PayPalPaymentScreenState extends State<PayPalPaymentScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   bool isConfirmed = false;

//   void _submitPayment() {
//     if (_formKey.currentState!.validate() && isConfirmed) {
//       // Here you would trigger real PayPal logic
//       Get.snackbar(
//         "Payment Success",
//         "Paid \$${amountController.text} via PayPal",
//         backgroundColor: Colors.green.shade100,
//       );
//     } else if (!isConfirmed) {
//       Get.snackbar(
//         "Confirmation Required",
//         "Please confirm the payment first",
//         backgroundColor: Colors.red.shade100,
//       );
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     amountController.dispose();
//     descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("PayPal Payment"),
//         backgroundColor: Color.fromARGB(255, 34, 80, 120),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.red),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               const Text(
//                 "Enter PayPal Payment Details",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: "PayPal Email",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) => value == null || value.isEmpty
//                     ? "Please enter your PayPal email"
//                     : null,
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: amountController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: "Amount",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) => value == null || value.isEmpty
//                     ? "Please enter the amount"
//                     : null,
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: descriptionController,
//                 maxLines: 2,
//                 decoration: const InputDecoration(
//                   labelText: "Description",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Checkbox(
//                     checkColor: Colors.white,
//                     value: isConfirmed,
//                     fillColor: MaterialStateProperty.all(
//                       const Color.fromARGB(255, 34, 80, 120),
//                     ),
//                     onChanged: (val) =>
//                         setState(() => isConfirmed = val ?? false),
//                   ),
//                   const Text("I confirm the payment"),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: ElevatedButton(
//                   onPressed: _submitPayment,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 34, 80, 120),
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
//                       "Pay with PayPal",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
