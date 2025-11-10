import 'package:flutter/material.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class PatientDashboardTabs extends StatefulWidget {
  const PatientDashboardTabs({super.key});

  @override
  State<PatientDashboardTabs> createState() => _PatientDashboardTabsState();
}

class _PatientDashboardTabsState extends State<PatientDashboardTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 220,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
        ],
      ),
      child: TabBar(
        controller: _tabController,

        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: const Color(0xFF4F8BFF), // blue highlight
          borderRadius: BorderRadius.circular(18),
        ),
        labelPadding: EdgeInsets.zero,

        // 👇 Handles text color automatically
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,

        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),

        tabs: const [
          Tab(child: ExtraSmallText(text: 'Doctor')),
          Tab(
            child: ExtraSmallText(text: 'Laboratory', color: Colors.black),
          ),
        ],
        indicatorColor: Colors.transparent,
      ),
    );
  }
}
