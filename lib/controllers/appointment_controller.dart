import 'package:get/get.dart';
import 'package:quick_token_new/models/appointment_model.dart';
import 'package:quick_token_new/services/appointment_services.dart';

class AppointmentController extends GetxController {
  String? doctorId;
  final appointments = <AppointmentModel>[].obs;
  final isLoading = false.obs;

  final AppointmentServices _service = AppointmentServices();

  /// Store doctorId after login (IMPORTANT)
  void setDoctorId(String id) {
    doctorId = id;
    print("✅ Doctor ID set: $doctorId");
    fetchAppointments();
  }

  /// Fetch appointments for doctor
  Future<void> fetchAppointments() async {
    if (doctorId == null || doctorId!.isEmpty) {
      print("⚠ doctorId is NULL. Cannot fetch.");
      return;
    }

    try {
      isLoading.value = true;
      final result = await _service.getAppointmentsByDoctor(doctorId!);
      appointments.assignAll(result);
      print("✅ Appointments loaded: ${appointments.length}");
    } catch (e) {
      print("❌ Error fetching appointments: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Add appointment (Patient booking)
  Future<void> addAppointment(AppointmentModel appointment) async {
    final success = await _service.createAppointment(appointment);

    if (success) {
      appointments.add(appointment);
      Get.snackbar("✅ Success", "Appointment Created");
    } else {
      Get.snackbar("❌ Error", "Failed to Create Appointment");
    }
  }

  /// Update Status
  Future<void> updateAppointmentStatus(String apptId, String newStatus) async {
    final success = await _service.updateStatus(apptId, newStatus);

    if (success) {
      int index = appointments.indexWhere((a) => a.id == apptId);
      if (index != -1) {
        appointments[index] = appointments[index].copyWith(status: newStatus);
        appointments.refresh();
      }
      Get.snackbar("✅ Updated", "Status changed to $newStatus");
    } else {
      Get.snackbar("❌ Failed", "Could not update status");
    }
  }
}

// import 'package:get/get.dart';
// import 'package:quick_token_new/models/appointment_model.dart';
// import 'package:quick_token_new/services/appointment_services.dart';

// class AppointmentController extends GetxController {
//   final AppointmentServices _service = AppointmentServices();

//   var appointments = <AppointmentModel>[].obs;
//   var isLoading = false.obs;

//   /// 🔹 Fetch appointments for a given doctorId
//   Future<void> fetchAppointments(String? doctorId) async {
//     print("🩺 [AppointmentController] fetchAppointments() called");
//     print("👨‍⚕️ Doctor ID received: $doctorId");

//     if (doctorId == null || doctorId.isEmpty || doctorId == "null") {
//       print("⚠️ Invalid doctorId — cannot fetch appointments");
//       return;
//     }

//     try {
//       isLoading.value = true;
//       print("🌐 Fetching appointments from API...");

//       final result = await _service.getAppointmentsByDoctor(doctorId);

//       print("📦 Appointments fetched: ${result.length}");
//       for (var appt in result) {
//         print(
//           "➡️ Appointment: ${appt.patientName}, Date: ${appt.date}, Time: ${appt.time}",
//         );
//       }

//       appointments.value = result;
//     } catch (e) {
//       print("❌ Error in fetchAppointments(): $e");
//     } finally {
//       isLoading.value = false;
//       print("✅ Fetch complete — isLoading set to false");
//     }
//   }

//   /// 🔹 Add new appointment to the backend + local list
//   Future<void> addAppointment(AppointmentModel appointment) async {
//     print("🆕 [AppointmentController] addAppointment() called");
//     print("📤 Appointment Data: ${appointment.toJson()}");

//     try {
//       final success = await _service.createAppointment(appointment);

//       if (success) {
//         appointments.add(appointment);
//         Get.snackbar("✅ Success", "Appointment added successfully!");
//         print("✅ Appointment added successfully to list");
//       } else {
//         Get.snackbar("❌ Error", "Failed to add appointment");
//         print("❌ API returned failure when adding appointment");
//       }
//     } catch (e) {
//       print("💥 Exception while adding appointment: $e");
//     }
//   }

//   /// 🔹 Accept / Confirm Appointment
//   Future<void> updateAppointmentStatus(String apptId, String newStatus) async {
//     try {
//       final success = await _service.updateStatus(apptId, newStatus);

//       if (success) {
//         final index = appointments.indexWhere((a) => a.id == apptId);
//         if (index != -1) {
//           appointments[index] = appointments[index].copyWith(status: newStatus);
//           appointments.refresh(); // UI refresh
//         }
//         Get.snackbar("✅ Success", "Appointment marked as $newStatus.");
//       } else {
//         Get.snackbar("❌ Failed", "Unable to update appointment status.");
//       }
//     } catch (e) {
//       print("❌ Error updating status: $e");
//     }
//   }
// }
