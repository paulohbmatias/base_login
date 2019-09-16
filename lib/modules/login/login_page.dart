import 'package:base_login/modules/login/login_bloc.dart';
import 'package:base_login/modules/login/widgets/loading_widget.dart';
import 'package:base_login/modules/login/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = Provider.of<LoginBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: bloc.isLoading,
        initialData: false,
        builder: (context, snapshot) {
          return !snapshot.data ? LoginBody(
            bloc: this.bloc,
          ) : LoadingWidget();
        },
      ),
    );
  }
}
