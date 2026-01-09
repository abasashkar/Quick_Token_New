import 'package:flutter/material.dart';

class QStyles {
  // H1 Style
  static TextStyle get h1 {
    return const TextStyle(
      fontSize: 20.0, // ✅ updated size
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      height: 1.3,
    );
  }

  // H2 Style
  static TextStyle get h2 {
    return const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, fontFamily: 'Inter');
  }

  // H3 Style
  static TextStyle get h3 {
    return const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: 'Inter');
  }

  // Title Style
  static TextStyle get title {
    return const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, fontFamily: 'Inter');
  }

  // Subtitle Style
  static TextStyle get subtitle {
    return const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Inter');
  }

  // Body Style (Android: 14 and 16)
  static TextStyle get bodySmall {
    return const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, fontFamily: 'Inter');
  }

  static TextStyle get bodyLarge {
    return const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, fontFamily: 'Inter');
  }

  // Caption Style (10-12)
  static TextStyle get captionSmall {
    return const TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, fontFamily: 'Inter');
  }

  static TextStyle get captionLarge {
    return const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'Inter');
  }
}
