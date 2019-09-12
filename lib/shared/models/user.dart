import 'package:base_login/shared/models/token.dart';

class User {
  int id;
  String name, email;
  Token token;

  User.fromJson(Map<String, dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.token = Token.fromJson(map['token']);
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'name': this.name,
    'email': this.email,
    'token': this.token.toJson()
  };
}