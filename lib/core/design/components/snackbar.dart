import 'package:flutter/material.dart';
import 'package:quick_token_new/core/design/shared/styles.dart';

class QSnackBar {
  static show(BuildContext context, String message) {
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Text(message, style: QStyles.bodySmall),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
