import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/controllers/appointment_controller.dart';

class DoctorConfirmTab extends StatelessWidget {
  const DoctorConfirmTab({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentController appointmentController =
        Get.find<AppointmentController>();

    return Obx(() {
      if (appointmentController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // Filter confirmed appointments
      final confirmedAppointments = appointmentController.appointments
          .where((appt) => appt.status == "confirmed")
          .toList();

      if (confirmedAppointments.isEmpty) {
        return const Center(
          child: Text(
            "No confirmed appointments yet",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        );
      }

      return ListView.builder(
        itemCount: confirmedAppointments.length,
        itemBuilder: (context, index) {
          final appointment = confirmedAppointments[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.patientName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text("Date: ${appointment.date}"),
                  Text("Time: ${appointment.time}"),
                  Text("Appointment No: ${appointment.apptNo}"),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Confirmed",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
