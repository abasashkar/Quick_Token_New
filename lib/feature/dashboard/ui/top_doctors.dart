// top_doctors.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/feature/appointment/UI/book_appointments.dart';
import 'package:quick_token_new/feature/appointment/bloc/appointment_bloc.dart';
import 'package:quick_token_new/model/doctor_model.dart';
import 'package:quick_token_new/repository/doctor_availablity_repo.dart';

class TopDoctors extends StatelessWidget {
  final List<Doctor> doctors;

  const TopDoctors({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    if (doctors.isEmpty) {
      return const Center(child: Text("No doctors available"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF4F8BFF), borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (context) => AppointmentBloc(
                          context.read<DoctorAvailabilityRepo>(),
                          appointmentRepo: null, // or real repo if you have one
                        ),
                        child: BookAppointments(doctor: doctor),
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: doctor.imageUrl.isNotEmpty ? NetworkImage(doctor.imageUrl) : null,
                  child: doctor.imageUrl.isEmpty ? const Icon(Icons.person, size: 40) : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(doctor.specialization, style: const TextStyle(color: Colors.white70)),
                    Text(doctor.location, style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
