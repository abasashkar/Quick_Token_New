class PatientModel {
  final String id;
  final String name;
  final String phone;
  final String dob;
  final String country;
  final String state;
  final String city;
  final String address1;
  final String address2;
  final String pincode;
  final String gender;

  PatientModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.dob,
    required this.country,
    required this.state,
    required this.city,
    required this.address1,
    required this.address2,
    required this.pincode,
    required this.gender,
  });

  // ✅ Add this factory constructor to fix your error
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      dob: json['dob'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      address1: json['address1'] ?? '',
      address2: json['address2'] ?? '',
      pincode: json['pincode'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  // Optional: Convert object back to JSON (useful for posting data)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'dob': dob,
      'country': country,
      'state': state,
      'city': city,
      'address1': address1,
      'address2': address2,
      'pincode': pincode,
      'gender': gender,
    };
  }
}
