import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:quick_token_new/authentication/doctor_Login.dart';
import 'package:quick_token_new/authentication/laboratory_Login.dart';
import 'package:quick_token_new/Authentication/patient_login.dart';
import 'package:quick_token_new/home/patient_home_screen.dart';
import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/widgets/big_text.dart';
import 'package:quick_token_new/widgets/custom_appbar.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class PatientAppointment extends StatefulWidget {
  const PatientAppointment({super.key});

  @override
  State<PatientAppointment> createState() => _PatientAppointmentState();
}

class _PatientAppointmentState extends State<PatientAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: const Icon(Icons.menu, color: Colors.white),
        title: const ExtraSmallText(
          text: 'Patient Login',
          size: 20,
          color: Colors.white,
        ),
      ),
      drawer: const SideBarButton(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAppointmentButton(
              icon: const FaIcon(
                FontAwesomeIcons.stethoscope,
                color: Colors.white,
                size: 40,
              ),
              title: "Book Doctor Appointment",
              color: const Color(0xFF3A6FF8),
              onTap: () {
                navigator!.pushReplacementNamed(RoutesHelper.patientLogin);
              },
            ),
            const SizedBox(height: 20),
            _buildAppointmentButton(
              icon: const Icon(Icons.science, color: Colors.white, size: 40),
              title: "Book Laboratory Appointment",
              color: const Color(0xFF3A6FF8),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Reusable appointment button widget
  Widget _buildAppointmentButton({
    required Widget icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 38),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideBarButton extends StatelessWidget {
  const SideBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF4F8BFF);

    return Drawer(
      backgroundColor: primaryBlue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: primaryBlue),
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // If you use an image, uncomment this:
                /*
                const Image(
                   image: AssetImage('assets/appLogo.png'),
                   width: 50,
                   height: 50,
                ),
                const SizedBox(width: 10),
                */
                // Using BigText for the logo text
                BigText(
                  text: 'QuickToken',
                  // BigText defaults to white and bold, which is good for the header
                  overflow: TextOverflow.ellipsis,
                  size: 28, // Make the header text larger
                ),
              ],
            ),
          ),

          // 2. Menu Items - Use default ListTile padding
          // The default ListTile gives good spacing, only need to wrap in
          // a slight horizontal padding if you want it inset from the edge.
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: Column(
              children: [
                ListTile(
                  title: const ExtraSmallText(
                    text: 'Patient Login',
                    size: 20, // Reduced size for better list density
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contex) => PatientLogin()),
                    );
                  },
                ),

                // Add a divider for visual separation, which is common
                const Divider(color: Colors.white54, height: 1),

                ListTile(
                  title: const ExtraSmallText(
                    text: 'Doctor Login',
                    size: 20,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contex) => DoctorLogin()),
                    );
                  },
                ),
                const Divider(color: Colors.white54, height: 1),

                ListTile(
                  title: const ExtraSmallText(
                    text: 'Laboratory Login',
                    size: 20,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contex) => LaboratoryLogin()),
                    );
                  },
                ),
                const Divider(color: Colors.white54, height: 1),

                ListTile(
                  title: const ExtraSmallText(
                    text: 'Privacy Policy',
                    size: 20,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // TODO: Navigate to Lab Login
                  },
                ),
                const Divider(color: Colors.white54, height: 1),

                ListTile(
                  title: const ExtraSmallText(
                    text: 'Terms & Conditions',
                    size: 20,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // TODO: Navigate to Lab Login
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
