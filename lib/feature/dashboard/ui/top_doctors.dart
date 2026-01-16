import 'package:flutter/material.dart';
import 'package:quick_token_new/appointment/book_appointments.dart';
import 'package:quick_token_new/model/doctor_model.dart';

class TopDoctors extends StatelessWidget {
  final bool isLoading;
  final List<Doctor> doctors;

  const TopDoctors({super.key, required this.isLoading, required this.doctors});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (doctors.isEmpty) {
      return const Center(child: Text("No doctors available."));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF4F8BFF),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 10, offset: const Offset(3, 6))],
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
                              errorBuilder: (_, __, ___) => const Icon(Icons.person, color: Colors.blue, size: 40),
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
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
  }
}
