class User {
  final int id;
  final String name;
  final String phone;
  final String password;
  final String confirmpassword;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.confirmpassword,
    required this.email,
  });

  factory User.init() => User(
        id: 0,
        name: '',
        phone: '',
        password: '',
        confirmpassword: '',
        email: '',
      );

}
