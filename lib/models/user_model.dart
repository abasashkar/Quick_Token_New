// class UserModel {
//   final String email;
//   final String token;
//   final String role;
//   final String id;

//   UserModel({
//     required this.email,
//     required this.token,
//     required this.role,
//     required this.id,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       email: json['email'] ?? json['user']?['email'] ?? '',
//       token: json['token'] ?? '',
//       role: json['role'] ?? json['user']?['role'] ?? '',
//       id: json['_id'] ?? json['user']?['_id'] ?? '',
//     );
//   }
// }

class UserModel {
  final String email;
  final String token;
  final String role;

  UserModel({required this.email, required this.token, required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      token: json['token'],
      role: json['role'], // IMPORTANT
    );
  }
}
