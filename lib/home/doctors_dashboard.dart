import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/appointment/doctor_confirm_tab.dart';
import 'package:quick_token_new/appointment/doctors_pending_tab.dart';
import 'package:quick_token_new/controllers/appointment_controller.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/custom_appointment_tab.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class DoctorsDashboard extends StatefulWidget {
  final Map<String, String>? newAppointment;
  final String? doctorId;

  const DoctorsDashboard({super.key, this.newAppointment, this.doctorId});

  @override
  State<DoctorsDashboard> createState() => _DoctorsDashboardState();
}

class _DoctorsDashboardState extends State<DoctorsDashboard> {
  final TextEditingController searchController = TextEditingController();
  final AppointmentController controller = Get.put(AppointmentController());
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: CustomAppBar(
        title: ExtraSmallText(
          text: 'Doctor Dashboard',
          color: Colors.white,
          size: 20,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),

          CustomAppointmentTab(
            onTabChanged: (index) => setState(() => selectedIndex = index),
          ),

          const SizedBox(height: 15),

          // Search Bar (optional keep)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: "Search patient...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: selectedIndex == 0
                ? const PendingDashboard() // ✅ Showing Pending Dashboard
                : const DoctorConfirmTab(),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/controllers/appointment_controller.dart';
// import 'package:quick_token_new/controllers/appointment_controller.dart';
// import 'package:quick_token_new/widgets/custom_appbar.dart';
// import 'package:quick_token_new/widgets/custom_appointment_tab.dart';
// import 'package:quick_token_new/widgets/extra_small_text.dart';

// class DoctorsDashboard extends StatefulWidget {
//   final Map<String, String>? newAppointment;
//   final String? doctorId; // ✅ doctorId passed for fetching appointments

//   const DoctorsDashboard({super.key, this.newAppointment, this.doctorId});

//   @override
//   State<DoctorsDashboard> createState() => _DoctorsDashboardState();
// }

// class _DoctorsDashboardState extends State<DoctorsDashboard> {
//   final TextEditingController searchController = TextEditingController();
//   final AppointmentController controller = Get.put(AppointmentController());
//   int selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     controller.fetchAppointments(widget.doctorId.toString()); // ✅ Fetch data
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F6FA),
//       appBar: CustomAppBar(
//         title: ExtraSmallText(
//           text: 'Doctor Dashboard',
//           color: Colors.white,
//           size: 20,
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 15),

//           // 🔹 Tabs
//           CustomAppointmentTab(
//             onTabChanged: (index) => setState(() => selectedIndex = index),
//           ),

//           const SizedBox(height: 15),

//           // 🔍 Search Bar
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 4,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search for patient or appointment',
//                   prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                   border: InputBorder.none,
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 15,
//                     horizontal: 20,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 10),

//           // 🩺 Appointment Cards Section
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }

//               final filteredAppointments = controller.appointments.where((
//                 appt,
//               ) {
//                 final query = searchController.text.toLowerCase();
//                 return appt.patientName.toLowerCase().contains(query) ||
//                     appt.apptNo.toLowerCase().contains(query);
//               }).toList();

//               if (filteredAppointments.isEmpty) {
//                 return const Center(
//                   child: Text(
//                     "No appointments found.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 );
//               }

//               return ListView.builder(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 10,
//                 ),
//                 itemCount: filteredAppointments.length,
//                 itemBuilder: (context, index) {
//                   final appt = filteredAppointments[index];
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF4F8BFF),
//                       borderRadius: BorderRadius.circular(18),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 6,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // 👤 Patient Info
//                         Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(50),
//                               child: Image.asset(
//                                 'assets/dentist.png',
//                                 width: 60,
//                                 height: 60,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(width: 14),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Patient: ${appt.patientName}",
//                                   style: const TextStyle(
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   "Appt No: ${appt.apptNo}",
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 14),

//                         // 🕓 Date & Time
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 const Icon(
//                                   Icons.calendar_today,
//                                   color: Colors.white,
//                                   size: 18,
//                                 ),
//                                 const SizedBox(width: 6),
//                                 Text(
//                                   appt.date,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 const Icon(
//                                   Icons.access_time,
//                                   color: Colors.white,
//                                   size: 18,
//                                 ),
//                                 const SizedBox(width: 6),
//                                 Text(
//                                   appt.time,
//                                   style: const TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 16),

//                         // 🔘 Buttons
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ElevatedButton.icon(
//                                 onPressed: () {
//                                   // You can later add API call for confirm
//                                 },
//                                 icon: const Icon(
//                                   Icons.check_circle,
//                                   color: Colors.white,
//                                 ),
//                                 label: const Text(
//                                   "Confirm",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color.fromARGB(
//                                     255,
//                                     37,
//                                     76,
//                                     154,
//                                   ),
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 12,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   elevation: 0,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: ElevatedButton.icon(
//                                 onPressed: () {
//                                   // You can later add API call for reject
//                                 },
//                                 icon: const Icon(
//                                   Icons.cancel,
//                                   color: Colors.white,
//                                 ),
//                                 label: const Text(
//                                   "Reject",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: const Color.fromARGB(
//                                     255,
//                                     216,
//                                     116,
//                                     116,
//                                   ),
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 12,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   elevation: 0,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
