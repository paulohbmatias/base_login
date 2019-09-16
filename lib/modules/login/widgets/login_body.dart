import 'package:base_login/modules/login/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {

  final LoginBloc bloc;

  const LoginBody({Key key,@required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<String>(
              stream: bloc.email,
              builder: (context, snapshot) {
                return TextField(
                  decoration: InputDecoration(
                      hintText: "Login", errorText: snapshot.error),
                  onChanged: bloc.changeEmail,
                );
              }),
          StreamBuilder<String>(
              stream: bloc.password,
              builder: (context, snapshot) {
                return TextField(
                  decoration: InputDecoration(
                      hintText: "Password", errorText: snapshot.error),
                  onChanged: bloc.changePassword,
                );
              }),
          StreamBuilder<bool>(
              stream: bloc.isValidFields,
              initialData: false,
              builder: (context, snapshot) {
                return Container(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed:
                        snapshot.hasData && snapshot.data ? bloc.signIn : null,
                    child: Text("Entrar"),
                  ),
                );
              })
        ],
      ),
    );
  }
}
