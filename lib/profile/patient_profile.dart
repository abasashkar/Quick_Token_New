import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_token_new/controllers/patient_controller.dart';
import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final PatientController patientController = Get.find<PatientController>();

  @override
  void initState() {
    super.initState();

    // ✅ Get saved patient ID from GetStorage
    final storage = GetStorage();
    final id = storage.read('patientId');

    if (id != null) {
      print("📦 Found saved patient ID: $id");
      patientController.getPatientById(id);
    } else {
      print("⚠️ No saved patient ID found — create a profile first");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showThemeToggle: true,
        title: const Center(
          child: ExtraSmallText(
            text: "User Profiles",
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() {
        if (patientController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final patient = patientController.currentPatient.value;

        // ⭐ If no patient data → Show Create Profile button
        if (patient == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "No profile found",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      RoutesHelper.createPatientScreen,
                    ); // Navigate to create screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F8BFF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Create Profile",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        }

        // ⭐ If patient exists → show profile
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/neurologist.png'),
              ),
              const SizedBox(height: 10),

              // Patient name
              Text(
                patient.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Patient phone
              Text(patient.phone),
              const SizedBox(height: 20),

              // Additional info cards
              _buildInfoCard(context, "Date of Birth", patient.dob),
              _buildInfoCard(context, "Country", patient.country),
              _buildInfoCard(context, "State", patient.state),
              _buildInfoCard(context, "City", patient.city),
              _buildInfoCard(context, "Gender", patient.gender),

              const SizedBox(height: 30),

              // Logout button
              ElevatedButton.icon(
                onPressed: () async {
                  final storage = GetStorage();
                  await storage.remove('patientId');
                  patientController.clearPatient();
                  Get.offAllNamed('/createPatient');
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const ExtraSmallText(
                  text: "Logout",
                  color: Colors.white,
                  size: 15,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F8BFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // ⭐ Info card builder
  Widget _buildInfoCard(BuildContext context, String title, String value) {
    return Card(
      color: const Color(0xFF4F8BFF),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(value, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }
}
