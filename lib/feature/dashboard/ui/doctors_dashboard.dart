import 'package:flutter/material.dart';
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
  int selectedIndex = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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

          CustomAppointmentTab(
            onTabChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          const SizedBox(height: 15),

          // Search Bar
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
                ? const SizedBox() // 🔴 REPLACE with PendingAppointments widget
                : const SizedBox(), // 🔴 REPLACE with CompletedAppointments widget
          ),
        ],
      ),
    );
  }
}
