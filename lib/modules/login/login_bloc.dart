import 'package:rxdart/rxdart.dart';

class LoginBloc {

  BehaviorSubject<String> _email = BehaviorSubject();
  BehaviorSubject<String> _password = BehaviorSubject();
  BehaviorSubject<bool> _isLoading = BehaviorSubject();

  Observable<String> get email => _email.stream;
  Observable<String> get password => _password.stream;
  Observable<bool> get isLoading => _isLoading.stream;

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  signIn(){
    
  }




  void dispose(){
    _email.close();
    _password.close();
    _isLoading.close();
  }
}