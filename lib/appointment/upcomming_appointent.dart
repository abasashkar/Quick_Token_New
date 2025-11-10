import 'package:flutter/material.dart';
import 'package:quick_token_new/appointment/patient_confirm_tab.dart';
import 'package:quick_token_new/appointment/patient_pending_tab.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/custom_appointment_tab.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/patient_dashboar_tabs.dart';

class UpcommingAppointent extends StatefulWidget {
  final Map<String, String>? newAppointment;

  const UpcommingAppointent({Key? key, this.newAppointment}) : super(key: key);

  @override
  State<UpcommingAppointent> createState() => _UpcommingAppointentState();
}

class _UpcommingAppointentState extends State<UpcommingAppointent> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: CustomAppBar(
        title: ExtraSmallText(
          text: 'UpComing Appointment',
          color: Colors.white,
          size: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const PatientDashboardTabs(),
            const SizedBox(height: 15),
            CustomAppointmentTab(
              onTabChanged: (index) {
                setState(() => selectedIndex = index);
              },
            ),
            const SizedBox(height: 15),
            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  PendingTab(newAppointment: widget.newAppointment),
                  PatientConfirmTab(),
                  Center(child: Text("Completed Tab")),
                  Center(child: Text("Canceled Tab")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
