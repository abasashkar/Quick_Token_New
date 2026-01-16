import 'package:quick_token_new/core/constants/api_routes.dart';

class Doctor {
  final String id;
  final String name;
  final String location;
  final double ratings;
  final String reviews;
  final String imageUrl;
  final String specialization;

  Doctor({
    required this.id,
    required this.name,
    required this.location,
    required this.ratings,
    required this.reviews,
    required this.imageUrl,
    required this.specialization,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    final image = json['image'];
    return Doctor(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      ratings: (json['ratings'] is num)
          ? (json['ratings'] as num).toDouble()
          : double.tryParse(json['ratings']?.toString() ?? '0') ?? 0.0,
      reviews: json['reviews']?.toString() ?? '',
      imageUrl: image != null && image.toString().isNotEmpty
          ? "${ApiRoutes.baseUrl}/$image"
          : "${ApiRoutes.baseUrl}/uploads/default_doctor_avatar.png",
      specialization: json['specialization'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'location': location,
      'ratings': ratings,
      'reviews': reviews,
      'imageUrl': imageUrl,
      'specialization': specialization,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Doctor && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
