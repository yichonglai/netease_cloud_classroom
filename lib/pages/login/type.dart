class Token {
  Token({this.token = ''});
  final String token;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    token: json["token"],
  );
  Map<String, dynamic> toJson() => {
    "token": token,
  };
}