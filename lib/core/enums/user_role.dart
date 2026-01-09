enum LoginIntent { patient, doctor, lab }

extension LoginIntentX on LoginIntent {
  String get value => name;
}
