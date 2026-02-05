import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/shared/colors.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';
import 'package:quick_token_new/core/design/components/extra_small_text.dart';
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
    return QBasePage(
      labelWidget: const ExtraSmallText(text: 'View Reports', size: 20, color: Colors.white),
      allowPopBack: true,
      enableScroll: false,
      addSafeSpace: false,

      children: [
        /// Tabs
        Center(
          child: Padding(padding: const EdgeInsets.all(8.0), child: const PatientDashboardTabs()),
        ),

        const SizedBox(height: 24),

        /// Soft message
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Qcolors.secondary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Qcolors.divider),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline, color: Qcolors.primary, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Reports are on the way. You’ll be able to view and download them here soon.",
                  style: QStyles.bodySmall.copyWith(color: Qcolors.primaryText),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        /// Report cards
        ReportCard(name: 'Yogesh Rathod', aptNo: '73', fileType: 'pdf', onView: () {}),
        ReportCard(name: 'Yogesh Rathod', aptNo: '83', fileType: 'image', onView: () {}),
        ReportCard(name: 'Yogesh Rathod', aptNo: '86', fileType: 'image', onView: () {}),
      ],
    );
  }
}
