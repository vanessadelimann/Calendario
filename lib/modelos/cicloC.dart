import 'dart:async';

class Ciclo {
  int _periodo = 0;
  int _intervalo = 0;
  late DateTime _dataInicial;
  late DateTime _datafinal;
  late int _dia;

  int get dia => _dia;
  int get periodo => _periodo;
  int get intervalo => _intervalo;
  DateTime get dataInicial => _dataInicial;
  DateTime get datafinal => _datafinal;

  final _blocController = StreamController();

  Stream get minhaStream => _blocController.stream;

  void addPeriodo(int periodo) {
    _periodo = periodo;
    _blocController.sink.add(_periodo);
  }

  void diaSelecionado(int dia) {
    _dia = dia;
    _blocController.sink.add(_dia);
  }

  void addIntervalo(int intervalo) {
    _intervalo = intervalo;
    _blocController.sink.add(_intervalo);
  }

  void addDataInicial(DateTime dataInicial) {
    _dataInicial = dataInicial;
    _blocController.sink.add(_dataInicial);
  }

  void calculaCiclo(int intervalo, DateTime dataInicial) {
    addDataInicial(dataInicial);
    addIntervalo(intervalo);
    _blocController.sink.add(dataInicial.add(Duration(days: intervalo)));
  }

  fecharStream() {
    _blocController.close();
  }
}
