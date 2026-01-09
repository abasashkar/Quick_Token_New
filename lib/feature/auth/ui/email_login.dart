// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quick_token_new/core/design/components/base_page.dart';
// import 'package:quick_token_new/core/design/components/button.dart';
// import 'package:quick_token_new/core/design/components/text_field.dart';
// import 'package:quick_token_new/core/design/shared/styles.dart';
// import 'package:quick_token_new/core/enums/app_status.dart';
// import 'package:quick_token_new/core/enums/user_role.dart';
// import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
// import 'package:quick_token_new/feature/auth/bloc/auth_state.dart';
// import 'package:quick_token_new/routes/routes_helper.dart';
// import 'package:quick_token_new/widgets/extra_small_text.dart';

// class EmailLoginScreen extends StatefulWidget {
//   final LoginIntent intent;
//   const EmailLoginScreen({super.key, required this.intent});

//   @override
//   State<EmailLoginScreen> createState() => _EmailLoginScreenState();
// }

// class _EmailLoginScreenState extends State<EmailLoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   LoginIntent get intent {
//     final args = ModalRoute.of(context)?.settings.arguments;
//     return args is LoginIntent ? args : LoginIntent.patient;
//   }

//   String get titleText {
//     switch (intent) {
//       case LoginIntent.patient:
//         return 'Patient Login';
//       case LoginIntent.doctor:
//         return 'Doctor Login';
//       case LoginIntent.lab:
//         return 'Laboratory Login';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthBloc, AuthState>(
//       listener: (context, state) {
//         print('[AuthBloc] State Changed: status=${state.status}, sendOTP=${state.sendOTP}, role=${state.role}');

//         /// ❌ Error handling
//         if (state.status == AppStatus.error) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(state.statusMessage.isEmpty ? 'Something went wrong' : state.statusMessage),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }

//         /// ✅ OTP sent → navigate
//         if (state.sendOTP && state.status == AppStatus.loaded) {
//           print('[AuthBloc] OTP SENT → email=${state.email}, role=${state.role}');
//           if (state.email == null || state.role == null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('Email or role missing. Please request OTP again.'),
//                 backgroundColor: Colors.red,
//               ),
//             );
//             return;
//           }

//           Navigator.pushNamed(context, RoutesHelper.verifyOtp, arguments: {'email': state.email, 'intent': intent});
//         }
//       },
//       builder: (context, state) {
//         return QBasePage(
//           labelWidget: Center(child: ExtraSmallText(text: titleText)), // ✅ now updates correctly
//           allowPopBack: true,
//           enableScroll: true,
//           addSafeSpace: true,
//           status: state.status == AppStatus.loading ? AppStatus.loading : AppStatus.loaded,
//           children: [
//             const SizedBox(height: 40),
//             Center(
//               child: ExtraSmallText(
//                 text: 'Please enter your email address to continue!',
//                 style: QStyles.bodySmall,
//                 color: Colors.black,
//                 maxLines: 2,
//               ),
//             ),
//             const SizedBox(height: 40),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(18),
//                 boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
//               ),
//               child: QTextField(
//                 controller: emailController,
//                 hintText: 'Email',
//                 keyboardType: TextInputType.emailAddress,
//               ),
//             ),
//             const SizedBox(height: 40),
//             QPrimaryButton(
//               text: 'Next',
//               isLoading: state.status == AppStatus.loading,
//               onTap: () {
//                 final email = emailController.text.trim();
//                 if (email.isEmpty || !email.contains('@')) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Please enter a valid email address'), backgroundColor: Colors.red),
//                   );
//                   return;
//                 }

//                 print('[AuthBloc] REQUEST OTP → email=$email, intent=${intent.name}');
//                 context.read<AuthBloc>().add(RequestOtpEvent(email: email, intent: intent));
//               },
//             ),
//             const SizedBox(height: 30),
//             Center(
//               child: ExtraSmallText(
//                 text: 'We need to verify your email address.\nAn OTP (One Time Password) will be sent.',
//                 style: QStyles.bodySmall,
//                 color: Colors.black,
//                 maxLines: 3,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/design/components/button.dart';
import 'package:quick_token_new/core/design/components/text_field.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';
import 'package:quick_token_new/core/enums/app_status.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_state.dart';
import 'package:quick_token_new/routes/routes_helper.dart';
import 'package:quick_token_new/widgets/extra_small_text.dart';

class EmailLoginScreen extends StatefulWidget {
  final LoginIntent intent;
  const EmailLoginScreen({super.key, required this.intent});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final TextEditingController emailController = TextEditingController();

  String get titleText {
    switch (widget.intent) {
      case LoginIntent.patient:
        return 'Patient Login';
      case LoginIntent.doctor:
        return 'Doctor Login';
      case LoginIntent.lab:
        return 'Laboratory Login';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print('[AuthBloc] State Changed: status=${state.status}, sendOTP=${state.sendOTP}, role=${state.role}');

        /// ❌ Error handling
        if (state.status == AppStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.statusMessage.isEmpty ? 'Something went wrong' : state.statusMessage),
              backgroundColor: Colors.red,
            ),
          );
        }

        /// ✅ OTP sent → navigate
        if (state.sendOTP && state.status == AppStatus.loaded) {
          print('[AuthBloc] OTP SENT → email=${state.email}, role=${state.role}');
          if (state.email == null || state.role == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Email or role missing. Please request OTP again.'),
                backgroundColor: Colors.red,
              ),
            );
            return;
          }

          Navigator.pushNamed(
            context,
            RoutesHelper.verifyOtp,
            arguments: {'email': state.email, 'intent': widget.intent},
          );
        }
      },
      builder: (context, state) {
        return QBasePage(
          labelWidget: Center(child: ExtraSmallText(text: titleText)), // ✅ now updates correctly
          allowPopBack: true,
          enableScroll: true,
          addSafeSpace: true,
          status: state.status == AppStatus.loading ? AppStatus.loading : AppStatus.loaded,
          children: [
            const SizedBox(height: 40),
            Center(
              child: ExtraSmallText(
                text: 'Please enter your email address to continue!',
                style: QStyles.bodySmall,
                color: Colors.black,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
              ),
              child:QTextField(
  controller: emailController,
  hintText: 'Email',
  keyboardType: TextInputType.emailAddress,
),

            ),

            const SizedBox(height: 40),
            QPrimaryButton(
              text: 'Next',
              isLoading: state.status == AppStatus.loading,
              onTap: () {
                final email = emailController.text.trim();
                if (email.isEmpty || !email.contains('@')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid email address'), backgroundColor: Colors.red),
                  );
                  return;
                }

                print('[AuthBloc] REQUEST OTP → email=$email, intent=${widget.intent.name}');
                context.read<AuthBloc>().add(RequestOtpEvent(email: email, intent: widget.intent));
              },
            ),
          ],
        );
      },
    );
  }
}
