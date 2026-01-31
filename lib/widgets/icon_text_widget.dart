// import 'package:flutter/material.dart';
// import 'package:quick_token_new/utils/dimensions.dart';
// import 'package:quick_token_new/widgets/small_text.dart';

// class IconTextWidget extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final Color color;
//   final Color iconColor;
//   final double iconSize;

//   const IconTextWidget({
//     super.key,
//     required this.icon,
//     required this.text,
//     required this.color,
//     required this.iconColor,
//     required this.iconSize,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, color: iconColor, size: iconSize),
//         const SizedBox(width: 5),
//         SmallText(text: text, overflow: TextOverflow.ellipsis, color: color),
//       ],
//     );
//   }
// }
