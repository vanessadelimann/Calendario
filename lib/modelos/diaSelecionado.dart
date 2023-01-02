import 'dart:core';

class DiaSelecionado {
  late DateTime _dia;
  bool _iniciou = false;
  String _humor = '';

  DateTime get dia => _dia;
  bool get iniciou => _iniciou;
  String get humor => _humor;

  void diaSelecionado(DateTime diaSelecionado) {
    _dia = diaSelecionado;
  }

  void cadastrarPrimeiroDia(bool iniciou) {
    _iniciou = iniciou;
  }

  void cadastrarHumor(String informarHumor) {
    _humor = informarHumor;
  }
}
