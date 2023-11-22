

class LoginModel {
  final String accessToken;
  final String tokenType;

  LoginModel({
    required this.accessToken,
    required this.tokenType,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
  };
}
