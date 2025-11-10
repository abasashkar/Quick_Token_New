import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_token_new/doctors/payment_succuess.dart';
import 'package:quick_token_new/doctors/payment_type.dart';
import 'package:quick_token_new/widgets/arrow_back.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({super.key});

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  bool isConfirmed = false;

  final _accountHolderController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _ifscCodeController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _accountHolderController.dispose();
    _accountNumberController.dispose();
    _bankNameController.dispose();
    _ifscCodeController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget buildTextField(String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 80, 120),
        elevation: 0,
        title: const Text(
          "Bank Transfer",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: ArrowBackButton(
            onTap: () {
              navigator!.push(
                MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
              );
            },
            iconSize: 19,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Bank Transfer Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            buildTextField("Account Holder's Name", _accountHolderController),
            const SizedBox(height: 12),
            buildTextField("Account Number", _accountNumberController),
            const SizedBox(height: 12),
            buildTextField("Bank Name", _bankNameController),
            const SizedBox(height: 12),
            buildTextField("IFSC Code", _ifscCodeController),
            const SizedBox(height: 12),
            buildTextField("Amount", _amountController),
            const SizedBox(height: 12),
            buildTextField("Description", _descriptionController),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: isConfirmed,
                  onChanged: (value) => setState(() => isConfirmed = value!),
                  activeColor: Color.fromARGB(255, 34, 80, 120),
                ),
                const Text("I confirm the transfer"),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isConfirmed
                    ? () {
                        // Handle transfer logic here
                        Get.snackbar(
                          "Success",
                          "Transfer Initiated!",
                          backgroundColor: Colors.green.shade100,
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 34, 80, 120),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: GestureDetector(
                  onTap: () {
                    navigator!.push(
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccessScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Transfer Now",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
