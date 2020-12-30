import 'dart:async';

import 'package:mvvm_poc/mvvm/IformViewModel.dart';

class FormViewModel implements IFormViewModel {
  StreamController<String> _emailController = StreamController<String>.broadcast();

  @override
  Sink get inputEmail => _emailController;

  @override
  Stream<bool> get outputBotaoHabilitado => _emailController.stream.map((email) => Util.validaEmail(email));

  @override
  Stream<String> get outputErro => outputBotaoHabilitado.map((emailValido) => emailValido ? null : "Email inválido");

  @override
  void dispose() {
    _emailController.close();
  }
}

class Util {
  static bool validaEmail(String email) {
    bool isValido = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return isValido;
  }
}
