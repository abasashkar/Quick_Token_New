// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quick_token_new/controllers/favorite_controller.dart';
// import 'package:quick_token_new/widgets/big_text.dart';
// import 'package:quick_token_new/widgets/extra_small_text.dart';
// import 'package:quick_token_new/widgets/icon_text_widget.dart';
// import 'package:quick_token_new/widgets/small_text.dart';

// class FavoriteDoctorsScreen extends StatelessWidget {
//   final favoriteController = Get.find<FavoriteController>(); //for favourite

//   FavoriteDoctorsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Favorite Doctors'),
//       ),
//       body: Obx(() {
//         if (favoriteController.favourites.isEmpty) {
//           return const Center(
//             child: Text('No favorite doctors added yet.'),
//           );
//         }
//         //for favourite

//         return ListView.builder(
//           itemCount: favoriteController.favourites.length,
//           itemBuilder: (context, index) {
//             final doctor = favoriteController.favourites[index];
//             //for favourite

//             return Container(
//               margin: const EdgeInsets.all(10),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 6,
//                     offset: Offset(2, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.asset(
//                       doctor.image,
//                       width: 80,
//                       height: 80,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         BigText(
//                           text: doctor.name,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 5),
//                         SmallText(
//                           text: doctor.location,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 8),
//                         Wrap(
//                           spacing: 8,
//                           children: [
//                             IconTextWidget(
//                               icon: Icons.star,
//                               text: doctor.ratings.toString(),
//                               color: Colors.black,
//                               iconSize: 14,
//                               iconColor: Colors.amber,
//                             ),
//                             ExtraSmallText(
//                               text: '(${doctor.review} reviews)',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.delete_outline),
//                     onPressed: () {
//                       favoriteController.toggleFavourite(doctor);
//                     },
//                     //for favourite
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
