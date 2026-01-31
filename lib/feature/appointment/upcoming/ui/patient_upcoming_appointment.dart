import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/feature/appointment/upcoming/bloc/patient_upcomingg_appointment_bloc.dart';
import 'package:quick_token_new/feature/appointment/widgets/appointment_card.dart';
import 'package:quick_token_new/feature/appointment/widgets/appointment_status_tab.dart';
import 'package:quick_token_new/utils/appointment_status_mapper.dart';

class PatientUpcomingScreen extends StatefulWidget {
  const PatientUpcomingScreen({super.key});

  @override
  State<PatientUpcomingScreen> createState() => _PatientUpcomingScreenState();
}

class _PatientUpcomingScreenState extends State<PatientUpcomingScreen> {
  int selectedTab = 0;

  void _fetch() {
    context.read<PatientUpcominggAppointmentBloc>().add(FetchPatientUpcominggAppointmentEvent());
  }

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppointmentStatusTabs(
          selectedIndex: selectedTab,
          onChanged: (index) {
            setState(() {
              selectedTab = index;
              _fetch();
            });
          },
        ),

        Expanded(
          child: BlocBuilder<PatientUpcominggAppointmentBloc, PatientUpcominggAppointmentState>(
            builder: (context, state) {
              if (state.status == AppStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              final appointment = selectedTab == 0 ? state.pendingAppointments : state.confirmedAppointments;

              if (appointment.isEmpty) {
                return const Center(child: Text("No appointments"));
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.pendingAppointments.length,
                itemBuilder: (context, index) {
                  final appt = state.pendingAppointments[index];

                  return UpcomingAppointmentCard(
                    name: appt.doctorId ?? '',
                    dateTime: appt.date,
                    status: appt.status.toAppointmentStatus(),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
