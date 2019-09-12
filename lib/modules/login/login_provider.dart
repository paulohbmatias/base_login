import 'package:base_login/modules/login/login_bloc.dart';
import 'package:base_login/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginBloc>(
      builder: (context) => LoginBloc(),
      dispose: (context, bloc) => bloc.dispose(),
      child: LoginPage(),
    );
  }
}