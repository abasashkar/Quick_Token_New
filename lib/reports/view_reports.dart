import 'package:flutter/material.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';
import 'package:quick_token_new/widgets/patient_dashboar_tabs.dart';
import 'package:quick_token_new/widgets/report_card.dart';

class ViewReports extends StatefulWidget {
  const ViewReports({super.key});

  @override
  State<ViewReports> createState() => _ViewReportsState();
}

class _ViewReportsState extends State<ViewReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ExtraSmallText(
          text: 'View Report',
          color: Colors.white,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: PatientDashboardTabs(),
            ),

            // Report cards section
            const SizedBox(height: 16),

            ReportCard(
              name: 'Yogesh Rathod',
              aptNo: '73',
              fileType: 'pdf',
              onView: () {},
            ),
            ReportCard(
              name: 'Yogesh Rathod',
              aptNo: '83',
              fileType: 'image',
              onView: () {},
            ),
            ReportCard(
              name: 'Yogesh Rathod',
              aptNo: '86',
              fileType: 'image',
              onView: () {},
            ),
          ],
        ),
      ),
    );
  }
}
