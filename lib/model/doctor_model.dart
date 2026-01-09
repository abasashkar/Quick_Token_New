class DoctorModel {
  final String id;
  final String name;
  final String location;
  final double ratings;
  final String reviews;
  final String imageUrl;
  final String specialization;

  DoctorModel({
    required this.id,
    required this.name,
    required this.location,
    required this.ratings,
    required this.reviews,
    required this.imageUrl,
    required this.specialization,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      ratings: (json['ratings'] is num)
          ? (json['ratings'] as num).toDouble()
          : double.tryParse(json['ratings']?.toString() ?? '0') ?? 0.0,
      reviews: json['reviews']?.toString() ?? '',
      imageUrl: json['imageUrl'] ?? '',
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
      identical(this, other) ||
      other is DoctorModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
