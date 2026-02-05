import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/feature/appointment/upcoming/bloc/doctor_pending_appointment_bloc.dart';
import 'package:quick_token_new/feature/appointment/widgets/appointment_card.dart';
import 'package:quick_token_new/feature/appointment/widgets/appointment_status_tab.dart';
import 'package:quick_token_new/utils/appointment_status_mapper.dart';
import 'package:quick_token_new/core/design/components/extra_small_text.dart';

class DoctorUpcomingScreen extends StatefulWidget {
  const DoctorUpcomingScreen({super.key});

  @override
  State<DoctorUpcomingScreen> createState() => _DoctorUpcomingScreenState();
}

class _DoctorUpcomingScreenState extends State<DoctorUpcomingScreen> {
  int selectedTab = 0;

  void _fetchByTab(int index) {
    final bloc = context.read<DoctorPendingAppointmentBloc>();

    if (index == 0) {
      bloc.add(FetchPendingAppointmentsEvent());
    } else {
      bloc.add(FetchConfirmedAppointmentsEvent());
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchByTab(0); // load pending by default
  }

  @override
  Widget build(BuildContext context) {
    return QBasePage(
      labelWidget: const ExtraSmallText(text: 'Scheduled Appointments', size: 20, color: Colors.white),
      allowPopBack: true,
      enableScroll: false,
      addSafeSpace: false,
      children: [
        /// Tabs
        AppointmentStatusTabs(
          selectedIndex: selectedTab,
          onChanged: (index) {
            setState(() => selectedTab = index);
            _fetchByTab(index);
          },
        ),

        const SizedBox(height: 8),

        /// Content
        Expanded(
          child: BlocBuilder<DoctorPendingAppointmentBloc, DoctorPendingAppointmentState>(
            builder: (context, state) {
              if (state.status == AppStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == AppStatus.error) {
                return Center(child: Text(state.statusMessage, style: QStyles.body));
              }

              final appointments = selectedTab == 0 ? state.pendingAppointments : state.confirmedAppointments;

              if (appointments.isEmpty) {
                return Center(child: Text("No appointments", style: QStyles.body));
              }

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];

                  return UpcomingAppointmentCard(
                    patientName: appointment.patientName ?? '',
                    doctorName: appointment.patientName ?? '',
                    dateTime: appointment.date,
                    tokenNo: appointment.tokenNumber,
                    status: appointment.status.toAppointmentStatus(),
                    isDoctorView: true,
                    onAccept: selectedTab == 0
                        ? () {
                            context.read<DoctorPendingAppointmentBloc>().add(AcceptAppointmentEvent(appointment.id));
                          }
                        : null,
                    onCancel: selectedTab == 0
                        ? () {
                            context.read<DoctorPendingAppointmentBloc>().add(RejectAppointmentEvent(appointment.id));
                          }
                        : null,
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
