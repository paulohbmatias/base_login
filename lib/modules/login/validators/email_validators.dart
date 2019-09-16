import 'dart:async';

mixin EmailValidator {
  StreamTransformer<String, String> validateEmailFromStream() =>
      StreamTransformer.fromHandlers(handleData: (email, sink) {
        String errorEmail = _validateEmail(email);
        if (errorEmail.isNotEmpty)
          sink.addError(errorEmail);
        else
          sink.add(email);
      });

  String validateEmailFromString(String email) => _validateEmail(email);

  String _validateEmail(String email) {
    if (email.isEmpty)
      return "Email can't be empty";
    else
      return "";
  }
}
