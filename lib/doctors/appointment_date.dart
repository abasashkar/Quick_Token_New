// import 'package:flutter/material.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:intl/intl.dart';
// import 'package:quick_token_new/doctors/payment_type.dart';
// import 'package:quick_token_new/routes/routes_helper.dart';
// import 'package:quick_token_new/widgets/arrow_back.dart';
// import 'package:quick_token_new/widgets/big_text.dart';

// class AppointmentDate extends StatefulWidget {
//   const AppointmentDate({super.key});

//   @override
//   State<AppointmentDate> createState() => _AppointmentDateState();
// }

// class _AppointmentDateState extends State<AppointmentDate> {
//   DateTime selectedDate = DateTime.now();
//   int selectedTimeIndex = 0;

//   final List<String> timeSlots = [
//     "01:00 AM",
//     "02:00 AM",
//     "03:00 AM",
//     "04:00 AM",
//     "05:00 AM",
//     "06:00 AM",
//     "07:00 AM",
//     "08:00 AM",
//     "09:00 AM",
//   ];

//   Future<void> _pickDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 365)),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Back button and title row
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Get.toNamed(RoutesHelper.homescreen);
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey.shade200,
//                         ),
//                         padding: const EdgeInsets.all(8.0),
//                         child: ArrowBackButton(
//                           onTap: () {
//                             navigator!.push(
//                               MaterialPageRoute(
//                                 builder: (context) => PatientHomeScreen(),
//                               ),
//                             );
//                           },
//                           iconSize: 19,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     BigText(
//                       text: 'Choose Appointment Date',
//                       size: 18,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 20),

//                 // "Choose Date" at the top
//                 BigText(
//                   size: 16,
//                   text: 'Choose Date',
//                   overflow: TextOverflow.ellipsis,
//                 ),

//                 const SizedBox(height: 15),

//                 // Calendar Date Picker
//                 GestureDetector(
//                   onTap: () => _pickDate(context),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Color.fromARGB(255, 34, 80, 120),
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           DateFormat('dd MMMM, yyyy').format(selectedDate),
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         Icon(
//                           Icons.calendar_today,
//                           color: Color.fromARGB(255, 34, 80, 120),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 15),

//                 // Time Slots Grid
//                 BigText(
//                   size: 16,
//                   text: 'Choose Time',
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 10),

//                 GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: timeSlots.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: 2.5,
//                     mainAxisSpacing: 12,
//                     crossAxisSpacing: 12,
//                   ),
//                   itemBuilder: (context, index) {
//                     bool isSelected = selectedTimeIndex == index;
//                     return GestureDetector(
//                       onTap: () => setState(() => selectedTimeIndex = index),
//                       child: Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: isSelected
//                               ? Color.fromARGB(255, 34, 80, 120)
//                               : Colors.grey[300],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Text(
//                           timeSlots[index],
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),

//                 const SizedBox(height: 24),

//                 // Next Payment Method Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       navigator!.push(
//                         MaterialPageRoute(
//                           builder: (context) => PaymentMethodScreen(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 34, 80, 120),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: const Text(
//                       "Next Payment Method",
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
