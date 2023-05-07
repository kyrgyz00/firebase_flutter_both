class UserModel {
  final String? id;
  final String nickName;
  final String email;
  final String phoneNumber;
  final String password;

  UserModel({
    this.id,
    required this.nickName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  toJson() {
    return {
      "NickName": nickName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "Password": password,
    };
  }
}
