class SignUpDataModel {
  final String email;
  final String password;
  final String fullname;
  final String phone;
  final String username;

  SignUpDataModel({
    required this.email,
    required this.password,
    required this.fullname,
    required this.phone,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'fullname': fullname,
      'phone': phone,
      'username': username,
    };
  }

  factory SignUpDataModel.fromMap(Map<String, dynamic> map) {
    return SignUpDataModel(
      email: map['email'] as String,
      password: map['password'] as String,
      fullname: map['fullname'] as String,
      phone: map['phone'] as String,
      username: map['username'] as String,
    );
  }
}
