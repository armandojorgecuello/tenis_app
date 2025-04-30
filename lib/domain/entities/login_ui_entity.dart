import 'package:flutter/widgets.dart';

class LoginUiEntity {
  final bool showPassword;
  final TextEditingController? email;
  final TextEditingController? password;
  final bool? isRememberMe;
  final bool loading;
  LoginUiEntity({
    required this.showPassword,
    required this.loading,
    this.email,
    this.password,
    this.isRememberMe,
  });

  factory LoginUiEntity.init() => LoginUiEntity(
    showPassword: false,
    email: null,
    password: null,
    isRememberMe: false,
    loading: false,
  );

  LoginUiEntity copyWith({
    bool? showPassword,
    TextEditingController? email,
    TextEditingController? password,
    bool? isRememberMe,
    bool? loading,
  }) {
    return LoginUiEntity(
      loading: loading ?? this.loading,
      showPassword: showPassword ?? this.showPassword,
      email: email ?? this.email,
      password: password ?? this.password,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }
}
