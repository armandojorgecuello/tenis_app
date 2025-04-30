
class RegisterUiEntity {
  final bool showPassword;
  final bool showConfirmPassword;
  final bool isLoading;
  final bool? isRememberMe;
  final bool rememberme;
  RegisterUiEntity({
    required this.showPassword,
    required this.rememberme,
    required this.showConfirmPassword,
    required this.isLoading,
    this.isRememberMe,
  });

  factory RegisterUiEntity.init() => RegisterUiEntity(
        showPassword: false,
        showConfirmPassword: false,
        isRememberMe: false,
        rememberme: false,
        isLoading: false
      );

  RegisterUiEntity copyWith({
    bool? showPassword,
    bool? showConfirmPassword,
    bool? isRememberMe,
    bool? rememberme,
    bool? isLoading,
  }) {
    return RegisterUiEntity(
      showPassword:showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
      isRememberMe:isRememberMe ?? this.isRememberMe,
      rememberme:rememberme ?? this.rememberme,
      isLoading:isLoading ?? this.isLoading,
    );
  }
}
