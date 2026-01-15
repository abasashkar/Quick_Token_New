import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/appointment/book_appointments.dart';

import 'package:quick_token_new/controllers/doctor_controller.dart';

class TopDoctors extends StatelessWidget {
  const TopDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorController doctorController = Get.find();

    return Obx(() {
      if (doctorController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (doctorController.filteredDoctors.isEmpty) {
        return const Center(child: Text("No doctors available."));
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: doctorController.filteredDoctors.length,
          itemBuilder: (context, index) {
            final doctor = doctorController.filteredDoctors[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF4F8BFF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 10, offset: const Offset(3, 6)),
                ],
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookAppointmentsScreen(doctorName: doctor.name, doctorImage: doctor.imageUrl),
                        ),
                      );
                    },

                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue.shade100, width: 2),
                      ),
                      child: ClipOval(
                        child: doctor.imageUrl.isNotEmpty
                            ? Image.network(
                                doctor.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person, color: Colors.blue, size: 40);
                                },
                              )
                            : const Icon(Icons.person, color: Colors.blue, size: 40),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          doctor.specialization,
                          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16, color: Colors.white),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                doctor.location,
                                style: const TextStyle(color: Colors.white, fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber[700], size: 18),
                            const SizedBox(width: 6),
                            Text(
                              doctor.ratings.toStringAsFixed(1),
                              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                doctor.reviews,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
