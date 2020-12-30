abstract class IFormViewModel {
  Sink get inputEmail;
  Stream<bool> get outputBotaoHabilitado;
  Stream<String> get outputErro;

  void dispose();
}
