import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_state.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  final UserRole intent;

  const VerifyOtpScreen({super.key, required this.email, required this.intent});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AppStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.statusMessage.isEmpty ? 'Something went wrong' : state.statusMessage),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state.isAuthenticated && state.status == AppStatus.loaded) {
          final role = state.role?.toLowerCase().trim();

          if (role == UserRole.patient.name) {
            context.go('/patientsHomeScreen');
          } else if (role == UserRole.doctor.name) {
            final isProfileCompleted = state.isProfileCompleted; // from backend/state
            if (isProfileCompleted) {
              context.go('/doctorHomeScreen');
            } else {
              context.go('/doctorCompleteProfile');
            }
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Unknown role: $role'), backgroundColor: Colors.red));
          }
        }
      },
      builder: (context, state) {
        final role = context.read<AuthBloc>().state.role;

        return Scaffold(
          backgroundColor: const Color(0xFFF2F4F7),
          appBar: AppBar(
            title: const Text('Verify OTP'),
            backgroundColor: const Color(0xFF4F8BFF),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 45),
            child: Column(
              children: [
                const Icon(Icons.verified_user_rounded, size: 90, color: Color(0xFF4F8BFF)),

                const SizedBox(height: 22),

                const ExtraSmallText(text: 'OTP sent to', color: Colors.black, size: 16),

                const SizedBox(height: 4),

                ExtraSmallText(text: widget.email, size: 15, color: Colors.black),

                const SizedBox(height: 6),

                ExtraSmallText(text: 'Role: ${role ?? 'unknown'}', size: 13, color: Colors.black),

                const SizedBox(height: 42),

                SizedBox(
                  width: 220,
                  height: 56,
                  child: TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 6,
                    style: const TextStyle(fontSize: 20, letterSpacing: 4, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      hintText: 'Enter OTP',
                      hintStyle: TextStyle(color: Colors.black),
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xFF4F8BFF),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
                    ),
                  ),
                ),

                const SizedBox(height: 34),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: state.status == AppStatus.loading
                        ? null
                        : () {
                            final otp = otpController.text.trim();
                            if (otp.length != 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter valid 6-digit OTP'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            final authState = context.read<AuthBloc>().state;

                            if (authState.role == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Role missing. Please request OTP again.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            context.read<AuthBloc>().add(
                              VerifyOtpEvent(email: widget.email, otp: otp, role: authState.role!),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F8BFF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    child: state.status == AppStatus.loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Verify OTP',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                  ),
                ),

                const SizedBox(height: 14),

                TextButton(
                  onPressed: state.status == AppStatus.loading
                      ? null
                      : () {
                          context.read<AuthBloc>().add(RequestOtpEvent(email: widget.email, intent: widget.intent));
                        },
                  child: const Text('Resend OTP', style: TextStyle(fontSize: 14, color: Color(0xFF4F8BFF))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
