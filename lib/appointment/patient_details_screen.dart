import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/controllers/appointment_controller.dart';
import 'package:quick_token_new/models/appointment_model.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/appointment/upcomming_appointent.dart';

class PatientDetailsScreen extends StatefulWidget {
  final String doctorName;
  final String doctorImage;
  final String selectedDate;
  final String selectedTime;

  const PatientDetailsScreen({
    super.key,
    required this.doctorName,
    required this.doctorImage,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: CustomAppBar(
        title: ExtraSmallText(
          text: 'Patient Details',
          size: 20,
          color: Colors.white,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        child: Column(
          children: [
            // Small doctor summary card
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF4F8BFF),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(widget.doctorImage),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExtraSmallText(
                        text: widget.doctorName,
                        size: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "${widget.selectedDate} | ${widget.selectedTime}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Name Field
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Patient Name",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Age Field
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Gender selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _genderBtn("Male"),
                _genderBtn("Female"),
                _genderBtn("Other"),
              ],
            ),

            const Spacer(),

            // Confirm Booking Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      ageController.text.isEmpty) {
                    Get.snackbar("Error", "Please fill all fields");
                    return;
                  }

                  final controller = Get.find<AppointmentController>();

                  String aptNo =
                      "APT${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}";

                  final appointment = AppointmentModel(
                    doctorId: "1234",
                    patientName: nameController.text.trim(),
                    date: widget.selectedDate,
                    time: widget.selectedTime,
                    apptNo: aptNo,
                    status: "pending",
                  );

                  controller.addAppointment(appointment);

                  Get.to(() => const UpcommingAppointent());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F8BFF),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const ExtraSmallText(
                  text: 'Confirm Booking',
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderBtn(String value) {
    bool isSelected = gender == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => gender = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF4F8BFF) : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
