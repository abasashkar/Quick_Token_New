import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_token_new/core/design/components/base_page.dart';
import 'package:quick_token_new/core/enums/user_role.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_bloc.dart';
import 'package:quick_token_new/feature/auth/bloc/auth_state.dart';

class UserSettings extends StatefulWidget {
  final UserRole intent;
  const UserSettings({super.key, required this.intent});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  String get titleText {
    switch (widget.intent) {
      case UserRole.patient:
        return 'Patient Login';
      case UserRole.doctor:
        return 'Doctor Login';
      case UserRole.lab:
        return 'Laboratory Login';
    }
  }

  String name = 'N/A';
  String email = 'N/A';

  @override
  void initState() {
    super.initState();

    // Get initial state
    final state = context.read<AuthBloc>().state;
    name = state.name ?? 'N/A';
    email = state.email ?? 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (prev, curr) => prev.name != curr.name || prev.email != curr.email,
      listener: (context, state) {
        setState(() {
          name = state.name ?? 'N/A';
          email = state.email ?? 'N/A';
        });
      },
      child: QBasePage(
        labelWidget: Center(
          child: Text(
            widget.intent == UserRole.patient
                ? 'Patient Settings'
                : widget.intent == UserRole.doctor
                ? 'Doctor Settings'
                : 'Laboratory Settings',
          ),
        ),
        allowPopBack: true,
        enableScroll: true,
        addSafeSpace: true,
        children: [
          const SizedBox(height: 40),
          Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 55),
            ),
          ),
          const SizedBox(height: 40),
          ListTile(title: const Text('Name'), subtitle: Text(name)),
          const SizedBox(height: 10),
          ListTile(title: const Text('Email'), subtitle: Text(email)),
        ],
      ),
    );
  }
}
