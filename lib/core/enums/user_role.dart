enum UserRole { patient, doctor, lab }

extension LoginIntentX on UserRole {
  String get value => name;
}
