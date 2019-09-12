import 'package:base_login/shared/models/user.dart';

abstract class UserRepository{
  User saveUser(User user);
  User getUser(int id);
}