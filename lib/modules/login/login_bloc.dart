import 'package:base_login/modules/login/validators/email_validators.dart';
import 'package:base_login/modules/login/validators/password_validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with EmailValidator, PasswordValidator {
  BehaviorSubject<String> _email = BehaviorSubject();
  BehaviorSubject<String> _password = BehaviorSubject();
  BehaviorSubject<bool> _isLoading = BehaviorSubject();

  Observable<String> get email =>
      _email.stream.transform(validatePasswordFromStream());
  Observable<String> get password =>
      _password.stream.transform(validatePasswordFromStream());
  Observable<bool> get isValidFields =>
      Observable.combineLatest2<String, String, bool>(email, password,
          (email, password) {
        return validateEmailFromString(_email.value).isEmpty &&
                validatePasswordFromString(_password.value).isEmpty
            ? true
            : false;
      });
  Observable<bool> get isLoading => _isLoading.stream;

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  signIn() {}

  void dispose() {
    _email.close();
    _password.close();
    _isLoading.close();
  }
}
