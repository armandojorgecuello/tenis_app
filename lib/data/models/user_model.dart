import 'package:app_tennis/domain/entities/user.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;
  final String password;
  final String confirmpassword;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.confirmpassword,
    required this.email,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      confirmpassword: json['confirmpassword'] as String,
      email: json['email'] as String,
    );
  }

  User toEntity()=> User(
    id: id,
    name: name,
    phone: phone,
    password: password,
    confirmpassword: confirmpassword,
    email: email,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'password': password,
      'confirmpassword': confirmpassword,
      'email': email,
    };
  }

}
