import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String email,
    required String password
  }) : super(
    email: email,
    password:  password
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      password: json['password'] as String,
      email: json['email'] as String,
    );
  }
}

