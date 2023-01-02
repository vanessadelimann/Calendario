import 'package:calendario/modelos/diaSelecionado.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDia extends Cubit<DiaSelecionado> {
  CubitDia() : super(DiaSelecionado());

  void diaPressionado(DateTime dia) {
    state.diaSelecionado(dia);
  }

  DateTime get data => state.dia;
}
