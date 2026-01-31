import 'package:flutter/material.dart';

enum AppointmentStatus { pending, confirmed, completed, canceled }

class UpcomingAppointmentCard extends StatelessWidget {
  final String name;
  final String dateTime;
  final AppointmentStatus status;
  final bool isDoctorView;
  final int? tokenNo;
  final VoidCallback? onAccept;
  final VoidCallback? onCancel;

  const UpcomingAppointmentCard({
    super.key,
    required this.name,
    required this.dateTime,
    required this.status,
    this.isDoctorView = false,
    this.tokenNo,
    this.onAccept,
    this.onCancel,
  });

  Color _statusColor() {
    switch (status) {
      case AppointmentStatus.pending:
        return Colors.orange;
      case AppointmentStatus.confirmed:
        return Colors.green;
      case AppointmentStatus.completed:
        return Colors.blue;
      case AppointmentStatus.canceled:
        return Colors.red;
    }
  }

  String _statusText() {
    return status.name.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),

            const SizedBox(height: 6),

            /// Date & Time
            Text(dateTime, style: TextStyle(color: Colors.grey.shade600)),

            if (isDoctorView && tokenNo != null) ...[
              const SizedBox(height: 6),
              Text("Token No: $tokenNo", style: const TextStyle(fontWeight: FontWeight.w500)),
            ],

            const SizedBox(height: 12),

            /// Patient View → Status Chip
            if (!isDoctorView)
              Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  label: Text(_statusText(), style: const TextStyle(color: Colors.white)),
                  backgroundColor: _statusColor(),
                ),
              ),

            /// Doctor View → Actions
            if (isDoctorView && status == AppointmentStatus.pending)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(onPressed: onCancel, child: const Text("Cancel")),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onAccept,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("Accept"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
