import 'dart:collection';

class Token{
  int expiryIn;
  String accessToken, refreshToken;

  Token.fromJson(LinkedHashMap<String, dynamic> json){
    this.expiryIn = json['expiryIn'];
    this.accessToken = json['accessToken'];
    this.refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() => {
    'expiryIn': this.expiryIn.toString(),
    'accessToken': this.accessToken,
    'refreshToken': this.refreshToken
  };
}