import 'package:flutter/material.dart';

import 'package:quick_token_new/appointment/upcomming_appointent.dart';
import 'package:quick_token_new/home/doctors_dashboard.dart';
import 'package:quick_token_new/home/patient_dashboard.dart';
import 'package:quick_token_new/profile/patient_profile.dart';
import 'package:quick_token_new/reports/view_reports.dart';
import 'package:quick_token_new/settings/user_profile.dart';

class DoctorHomeScreen extends StatefulWidget {
  // <-- add this

  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  State<DoctorHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DoctorHomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      DoctorsDashboard(),
      const FindDoctors(),
      const ViewReports(),
      const ProfileScreen(),
      const UserProfile(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _iconColor(int index) =>
      _selectedIndex == index ? Colors.blue : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                tooltip: 'Dashboard',
              ),
              IconButton(
                icon: Icon(Icons.access_time, color: _iconColor(1)),
                onPressed: () => _onItemTapped(1),
                tooltip: 'Schedule',
              ),
              IconButton(
                icon: Icon(Icons.person_add_alt, color: _iconColor(2)),
                onPressed: () => _onItemTapped(2),
                tooltip: 'Contact',
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, color: _iconColor(3)),
                onPressed: () => _onItemTapped(3),
                tooltip: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
