import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/feature/availablity/bloc/availablity_bloc.dart';
import 'package:quick_token_new/feature/availablity/widgets/availablity_card.dart';
import 'package:quick_token_new/feature/availablity/widgets/primary_button.dart';
import 'package:quick_token_new/feature/availablity/widgets/succuess_icon.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/routes/routes_helper.dart';

class DoctorAvailabilitySuccessPage extends StatelessWidget {
  const DoctorAvailabilitySuccessPage({super.key});

  static const EdgeInsets pagePadding = EdgeInsets.symmetric(horizontal: 24);

  @override
  Widget build(BuildContext context) {
    final state = context.read<AvailablityBloc>().state;

    return QBasePage(
      labelWidget: const ExtraSmallText(text: 'Availability Saved'),
      allowPopBack: false,
      enableScroll: true,
      addSafeSpace: true,
      children: [
        Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SuccessIcon(),
              const SizedBox(height: 28),
              const ExtraSmallText(
                text: 'Availability Saved!',
                size: 22,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const ExtraSmallText(
                text: 'Your availability has been saved successfully.',
                size: 14,
                color: Colors.black54,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              const ExtraSmallText(
                text: 'You will now be available for appointments as per the schedule below.',
                size: 13,
                color: Colors.black54,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // ✅ Pass actual state values to the summary card
              AvailabilitySummaryCard(
                workingDays: state.workingDays,
                startTime: state.startTime,
                endTime: state.endTime,
                breakStart: state.breakStart,
                breakEnd: state.breakEnd,
                slotDuration: state.slotDuration,
              ),

              const SizedBox(height: 32),
              PrimaryButton(
                title: 'Back to Home',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, RoutesHelper.doctorHomeScreen, (route) => false);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
