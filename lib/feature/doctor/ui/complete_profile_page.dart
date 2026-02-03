import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/feature/availablity/widgets/primary_button.dart';
import 'package:quick_token_new/feature/doctor/bloc/doctor_profile_bloc.dart';
import 'package:quick_token_new/feature/doctor/widgets/doctor_input_tile.dart';
import '../widgets/doctor_profile_avatar.dart';
import '../../auth/bloc/auth_bloc.dart';

class DoctorCompleteProfilePage extends StatefulWidget {
  const DoctorCompleteProfilePage({super.key});

  @override
  State<DoctorCompleteProfilePage> createState() => _DoctorCompleteProfilePageState();
}

class _DoctorCompleteProfilePageState extends State<DoctorCompleteProfilePage> {
  String specialization = '';
  String location = '';

  void _openTextPicker(
    BuildContext context, {
    required String title,
    required String hint,
    required Function(String value) onSave,
  }) {
    final controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: MediaQuery.of(context).viewInsets.bottom + 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: hint,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                title: 'Save',
                onPressed: () {
                  onSave(controller.text.trim());
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorProfileBloc, DoctorProfileState>(
      listener: (context, state) {
        if (state.status == AppStatus.loaded && state.success) {
          // ✅ Update AuthBloc to mark profile completed
          context.read<AuthBloc>().add(UpdateProfileCompletedEvent(isCompleted: true));

          // ✅ Navigate after frame
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully')));
            context.go('/doctorHomeScreen');
          });
        }

        if (state.status == AppStatus.error) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.statusMessage)));
          });
        }
      },
      builder: (context, state) {
        return QBasePage(
          label: 'Complete Profile',
          addSafeSpace: true,
          enableScroll: true,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const DoctorProfileAvatar(),
            const SizedBox(height: 32),

            /// Specialization
            ProfileInputTile(
              icon: Icons.medical_services_outlined,
              label: specialization.isEmpty ? 'Specialization' : specialization,
              onTap: () => _openTextPicker(
                context,
                title: 'Specialization',
                hint: 'e.g. Cardiologist',
                onSave: (value) => setState(() => specialization = value),
              ),
            ),
            const SizedBox(height: 12),

            /// Location
            ProfileInputTile(
              icon: Icons.location_on_outlined,
              label: location.isEmpty ? 'Location' : location,
              onTap: () => _openTextPicker(
                context,
                title: 'Location',
                hint: 'e.g. Chennai, Tamil Nadu',
                onSave: (value) => setState(() => location = value),
              ),
            ),
            const SizedBox(height: 32),

            /// Save Button
            PrimaryButton(
              title: state.status == AppStatus.loading ? 'Saving...' : 'Save Profile',
              onPressed: state.status == AppStatus.loading
                  ? null
                  : () {
                      if (specialization.isEmpty || location.isEmpty) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
                        return;
                      }

                      // ✅ Only send specialization & location
                      context.read<DoctorProfileBloc>().add(
                        OnUpdateDoctorProfileEvent(specialization: specialization, location: location),
                      );
                    },
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
