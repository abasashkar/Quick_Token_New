// Updated clean & minimalistic UI
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/appointment/patient_details_screen.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class BookAppointmentsScreen extends StatefulWidget {
  final String doctorName;
  final String doctorImage;

  const BookAppointmentsScreen({
    Key? key,
    required this.doctorName,
    required this.doctorImage,
  }) : super(key: key);

  @override
  State<BookAppointmentsScreen> createState() => _BookAppointmentsScreenState();
}

class _BookAppointmentsScreenState extends State<BookAppointmentsScreen> {
  String selectedDate = "Thu 3 Nov 2022";
  String selectedTime = "07:30 PM";

  final List<String> timeSlots = [
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "01:00 PM",
    "01:30 PM",
  ];

  String _getWeekday(int weekday) {
    const weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return weekdays[weekday - 1];
  }

  String _getMonth(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      appBar: CustomAppBar(
        title: ExtraSmallText(
          text: 'Book Appointment',
          size: 20,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xFF4F8BFF),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: widget.doctorImage.isNotEmpty
                        ? NetworkImage(widget.doctorImage)
                        : const AssetImage('assets/neurologist.png')
                              as ImageProvider,
                  ),
                  const SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExtraSmallText(
                        text: widget.doctorName,
                        size: 21,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 6),
                      const ExtraSmallText(
                        text: 'Consultation Fee - 1000 Rs',
                        size: 15,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Date Picker
            const Text(
              "Select Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 60)),
                      );

                      if (pickDate != null) {
                        setState(() {
                          selectedDate =
                              "${_getWeekday(pickDate.weekday)} ${pickDate.day} ${_getMonth(pickDate.month)} ${pickDate.year}";
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F8BFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Pick',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Select Time",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            // Time Slots
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 12,
                  children: timeSlots.map((time) {
                    final bool isSelected = selectedTime == time;
                    return GestureDetector(
                      onTap: () => setState(() => selectedTime = time),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF4F8BFF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF4F8BFF)
                                : Colors.grey.shade300,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Confirm Booking Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => PatientDetailsScreen(
                      doctorName: widget.doctorName,
                      doctorImage: widget.doctorImage,
                      selectedDate: selectedDate,
                      selectedTime: selectedTime,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F8BFF),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/appointment/patient_details_screen.dart';
// import 'package:quick_token_new/widgets/custom_appbar.dart';
// import 'package:quick_token_new/widgets/extra_small_text.dart';

// class BookAppointmentsScreen extends StatefulWidget {
//   final String doctorName;
//   final String doctorImage;

//   const BookAppointmentsScreen({
//     Key? key,

//     required this.doctorName,
//     required this.doctorImage,
//   }) : super(key: key);

//   @override
//   State<BookAppointmentsScreen> createState() => _BookAppointmentsScreenState();
// }

// class _BookAppointmentsScreenState extends State<BookAppointmentsScreen> {
//   String selectedDate = "Thu 3 Nov 2022";
//   String selectedTime = "07:30 PM";

//   final List<String> timeSlots = [
//     "09:00 AM",
//     "09:30 AM",
//     "10:00 AM",
//     "10:30 AM",
//     "11:00 AM",
//     "11:30 AM",
//     "12:00 PM",
//     "12:30 PM",
//     "01:00 PM",
//     "01:30 PM",
//   ];

//   String _getWeekday(int weekday) {
//     const weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
//     return weekdays[weekday - 1];
//   }

//   String _getMonth(int month) {
//     const months = [
//       "Jan",
//       "Feb",
//       "Mar",
//       "Apr",
//       "May",
//       "Jun",
//       "Jul",
//       "Aug",
//       "Sep",
//       "Oct",
//       "Nov",
//       "Dec",
//     ];
//     return months[month - 1];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       appBar: CustomAppBar(
//         title: ExtraSmallText(
//           text: 'Book Appointment',
//           size: 20,
//           color: Colors.white,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
//         child: Column(
//           children: [
//             // Doctor Card
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundImage: widget.doctorImage.isNotEmpty
//                         ? NetworkImage(widget.doctorImage)
//                         : const AssetImage('assets/neurologist.png')
//                               as ImageProvider,
//                   ),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ExtraSmallText(
//                         text: widget.doctorName,
//                         size: 20,
//                         color: Colors.black,
//                       ),
//                       const SizedBox(height: 4),
//                       const ExtraSmallText(
//                         text: 'Consultation Fee - 1000 Rs',
//                         size: 15,
//                         color: Colors.black,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 25),

//             // Date Picker
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     DateTime? pickDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime.now().add(const Duration(days: 60)),
//                     );

//                     if (pickDate != null) {
//                       setState(() {
//                         selectedDate =
//                             "${_getWeekday(pickDate.weekday)} ${pickDate.day} ${_getMonth(pickDate.month)} ${pickDate.year}";
//                       });
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF4F8BFF),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 24,
//                       vertical: 12,
//                     ),
//                   ),
//                   child: const ExtraSmallText(
//                     text: 'Select Date',
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Text(
//                   selectedDate,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 25),

//             // Time Slots
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Wrap(
//                   spacing: 10,
//                   runSpacing: 12,
//                   children: timeSlots.map((time) {
//                     final bool isSelected = selectedTime == time;
//                     return ChoiceChip(
//                       label: Text(
//                         time,
//                         style: TextStyle(
//                           color: isSelected ? Colors.white : Colors.black87,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       selected: isSelected,
//                       selectedColor: const Color(0xFF4F8BFF),
//                       backgroundColor: Colors.grey.shade200,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 12,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       onSelected: (selected) {
//                         if (selected) {
//                           setState(() => selectedTime = time);
//                         }
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),

//             // Confirm Booking Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Get.to(
//                     () => PatientDetailsScreen(
//                       doctorName: widget.doctorName,
//                       doctorImage: widget.doctorImage,
//                       selectedDate: selectedDate,
//                       selectedTime: selectedTime,
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4F8BFF),
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: const ExtraSmallText(
//                   text: 'Next',
//                   size: 20,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
