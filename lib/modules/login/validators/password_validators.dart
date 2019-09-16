import 'dart:async';

mixin PasswordValidator{
  StreamTransformer<String, String> validatePasswordFromStream() =>
      StreamTransformer.fromHandlers(handleData: (password, sink) {
        String errorPassword = _validatePassword(password);
        if (errorPassword.isNotEmpty)
          sink.addError(errorPassword);
        else
          sink.add(password);
      });

  String validatePasswordFromString(String email) => _validatePassword(email);

  String _validatePassword(String email) {
    if (email.isEmpty)
      return "Password can't be empty";
    else
      return "";
  }
}