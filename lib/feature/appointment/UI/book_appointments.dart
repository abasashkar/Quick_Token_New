import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/constants/app_spacing.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/feature/appointment/bloc/appointment_bloc.dart';
import 'package:quick_token_new/feature/appointment/bloc/book_appointment_bloc.dart';
import 'package:quick_token_new/feature/appointment/widgets/date_picker_field.dart';
import 'package:quick_token_new/feature/appointment/widgets/doctor_header_card.dart';
import 'package:quick_token_new/feature/appointment/widgets/timeslot_grid.dart';
import 'package:quick_token_new/feature/availablity/widgets/primary_button.dart';
import 'package:quick_token_new/model/doctor_model.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/vertical_space.dart';

class BookAppointments extends StatefulWidget {
  final Doctor doctor;
  const BookAppointments({super.key, required this.doctor});

  @override
  State<BookAppointments> createState() => _BookAppointmentsState();
}

class _BookAppointmentsState extends State<BookAppointments> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    /// Fetch slots for today
    context.read<AppointmentBloc>().add(
      FetchAvailableSlots(doctorId: widget.doctor.id, date: _formatDate(selectedDate)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookAppointmentBloc, BookAppointmentState>(
      listener: (context, state) {
        debugPrint('📣 Booking listener: ${state.status}');

        if (state.status == AppStatus.loading) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Booking appointment...')));
        }

        if (state.status == AppStatus.succuess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Appointment booked successfully ✅')));

          Navigator.pop(context); // go back after success
        }

        if (state.status == AppStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.statusMessage)));
        }
      },
      child: QBasePage(
        labelWidget: const ExtraSmallText(text: 'Book Appointment', size: 18),
        allowPopBack: true,
        enableScroll: true,
        addSafeSpace: true,
        children: [
          DoctorHeaderCard(
            name: widget.doctor.name,
            specialization: widget.doctor.specialization,
            imageUrl: widget.doctor.imageUrl,
          ),

          const VSpace(AppSpacing.lg),

          _sectionTitle('Select Date'),
          const VSpace(AppSpacing.sm),
          DatePickerField(
            selectedDate: selectedDate,
            onDateSelected: (date) {
              setState(() => selectedDate = date);

              context.read<AppointmentBloc>().add(
                FetchAvailableSlots(doctorId: widget.doctor.id, date: _formatDate(date)),
              );
            },
          ),

          const VSpace(AppSpacing.lg),
          _sectionTitle('Available Slots'),
          const VSpace(AppSpacing.sm),

          /// Slots from API
          BlocBuilder<AppointmentBloc, AppointmentState>(
            buildWhen: (p, c) => p.status != c.status || p.slots != c.slots || p.selectedTime != c.selectedTime,
            builder: (context, state) {
              if (state.status == AppStatus.loading) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state.status == AppStatus.error) {
                return Padding(padding: const EdgeInsets.all(16), child: Text(state.statusMessage));
              }

              if (state.slots.isEmpty) {
                return const Padding(padding: EdgeInsets.all(16), child: Text('No slots available'));
              }

              return TimeSlotGrid(
                slots: state.slots,
                selectedTime: state.selectedTime,
                onTimeSelected: (time) {
                  context.read<AppointmentBloc>().add(SelectTimeSlot(time));
                },
              );
            },
          ),

          const VSpace(AppSpacing.xl),

          /// Book button
          PrimaryButton(
            title: 'Book Appointment',
            onPressed: () {
              final appointmentState = context.read<AppointmentBloc>().state;

              if (appointmentState.selectedTime.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a time slot')));
                return;
              }

              context.read<BookAppointmentBloc>().add(
                SubmitBooking(
                  doctorId: widget.doctor.id,
                  date: _formatDate(selectedDate),
                  slot: appointmentState.selectedTime,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Widget _sectionTitle(String text) {
    return ExtraSmallText(text: text, size: 16, color: Colors.black);
  }
}
