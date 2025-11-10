import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/controllers/appointment_controller.dart';
import 'package:quick_token_new/controllers/appointment_controller.dart';
import 'package:quick_token_new/home/doctor_home_screen.dart';

class PendingTab extends StatelessWidget {
  final Map<String, String>? newAppointment;
  const PendingTab({super.key, this.newAppointment});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentController>();
    return Obx(() {
      if (controller.appointments.isEmpty) {
        return const Center(child: Text("No Pending Appointments"));
      }
      if (controller.appointments.isEmpty) {
        return const Center(child: Text("No Pending Appointments"));
      }

      return ListView.builder(
        itemCount: controller.appointments.length,
        itemBuilder: (context, index) {
          final item = controller.appointments[index];
          return AppointmentCard(
            date: item.date,
            time: item.time,
            doctorName: item.doctorId, // or display doctor name if you have it
            aptNo: item.apptNo,
          );
        },
      );
    });
  }
}

class AppointmentCard extends StatelessWidget {
  final String date;
  final String time;
  final String doctorName;
  final String aptNo;

  const AppointmentCard({
    super.key,
    required this.date,
    required this.time,
    required this.doctorName,
    required this.aptNo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF4F8BFF),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Apt No: $aptNo',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            side: BorderSide.none,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Reschedule'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// Adds spacing between cards
        const SizedBox(height: 16),
        Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorHomeScreen()),
                );
              },
              child: Text('GOTO'),
            ),
          ],
        ),
      ],
    );
  }
}
