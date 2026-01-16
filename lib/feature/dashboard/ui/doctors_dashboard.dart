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
        title: ExtraSmallText(text: 'Doctor Dashboard', color: Colors.white, size: 20),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),

          CustomAppointmentTab(onTabChanged: (index) => setState(() => selectedIndex = index)),

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
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
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
