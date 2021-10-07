class SignEmailBody {
  final String? username;
  final String? password;

  SignEmailBody({this.username, this.password});

  factory SignEmailBody.fromJson(Map<String, dynamic> json) {
    return SignEmailBody(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
