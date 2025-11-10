import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quick_token_new/home/patient_home_screen.dart';
import 'package:quick_token_new/widgets/arrow_back.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 80, 120),
        elevation: 0,
        leading: IconButton(
          icon: ArrowBackButton(
            onTap: () {
              navigator!.push(
                MaterialPageRoute(builder: (context) => PatientHomeScreen()),
              );
            },
            iconSize: 19,
          ),
          onPressed: () {
            navigator!.push(
              MaterialPageRoute(builder: (context) => PatientHomeScreen()),
            );
          },
        ),
        title: const Text(
          'Payment History',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Payment Card 1
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/dentist.png"),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Maria',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Specialty: Therapist',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text('Amount: \$50.00', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text(
                        'Date: 2024-11-18 - Time: 10:30 AM',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Payment Mode: Credit Card',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Status: Completed',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '\$50.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Payment Card 2
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/dentist.png"),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Jane Smith',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Specialty: Dentist',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text('Amount: \$30.00', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text(
                        'Date: 2024-11-17 - Time: 3:45 PM',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Payment Mode: PayPal',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Status: Completed',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '\$30.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Payment Card 3
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/dentist.png"),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Sarah',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Specialty: General Practitioner',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text('Amount: \$100.00', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 4),
                      Text(
                        'Date: 2024-11-16 - Time: 8:15 AM',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Payment Mode: QR Code',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Status: Completed',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '\$100.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
