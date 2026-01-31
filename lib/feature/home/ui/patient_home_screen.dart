import 'package:flutter/material.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/feature/appointment/upcoming/ui/patient_upcoming_appointment.dart';
import 'package:quick_token_new/feature/dashboard/ui/patient_dashboard.dart';
import 'package:quick_token_new/profile/user_settings.dart';
import 'package:quick_token_new/reports/view_reports.dart';

class PatientHomeScreen extends StatefulWidget {
  // final String patientId;

  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PatientHomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const FindDoctors(),
      PatientUpcomingScreen(),
      const ViewReports(),
      const UserSettings(intent: UserRole.patient),
    ];
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Color _iconColor(int index) => _selectedIndex == index ? Colors.blue : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8.0,
        elevation: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.dashboard, color: _iconColor(0)),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.description_outlined, color: _iconColor(1)),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon: Icon(Icons.file_download_outlined, color: _iconColor(2)),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, color: _iconColor(3)),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
