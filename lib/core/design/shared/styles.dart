import 'package:flutter/material.dart';

class QStyles {
  static const String _font = 'Inter';

  /// ----------------------------
  /// Headings
  /// ----------------------------
  static const TextStyle h1 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: _font, height: 1.3);

  static const TextStyle h2 = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: _font, height: 1.3);

  static const TextStyle h3 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: _font, height: 1.25);

  /// ----------------------------
  /// Titles & Labels
  /// ----------------------------
  static const TextStyle title = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: _font);

  static const TextStyle label = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: _font);

  /// ----------------------------
  /// Body Text
  /// ----------------------------
  static const TextStyle body = TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: _font, height: 1.5);

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: _font,
    height: 1.45,
  );

  /// ----------------------------
  /// Captions & Hints
  /// ----------------------------
  static const TextStyle caption = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: _font);

  static const TextStyle hint = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: _font);

  /// ----------------------------
  /// Buttons
  /// ----------------------------
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: _font,
    letterSpacing: 0.3,
  );

  /// ----------------------------
  /// Status / Feedback
  /// ----------------------------
  static const TextStyle error = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: _font);

  static const TextStyle success = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: _font);
}
