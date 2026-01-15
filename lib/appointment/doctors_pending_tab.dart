import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/controllers/appointment_controller.dart';

class PendingDashboard extends StatelessWidget {
  const PendingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // ✅ Show only pending appointments
      final pendingAppointments = controller.appointments
          .where((appt) => appt.status.toLowerCase() == "pending")
          .toList();

      if (pendingAppointments.isEmpty) {
        return const Center(
          child: Text(
            "No Pending Appointments",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: pendingAppointments.length,
        itemBuilder: (context, index) {
          final appt = pendingAppointments[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF4F8BFF),
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Patient: ${appt.patientName}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Appointment No: ${appt.apptNo}",
                  style: const TextStyle(fontSize: 15, color: Colors.white70),
                ),
                const SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          appt.date,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          appt.time,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // ✅ Accept Button FIX
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4F8BFF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      await controller.updateAppointmentStatus(
                        appt.id.toString(),
                        "confirmed",
                      );

                      Get.snackbar(
                        "Success",
                        "Appointment accepted",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green.withOpacity(0.8),
                        colorText: Colors.white,
                      );
                    },

                    child: const Text(
                      "Accepttt",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
