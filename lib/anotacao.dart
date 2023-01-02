import 'package:calendario/modelos/cubitDia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class Anotacao extends StatefulWidget {
  const Anotacao({Key? key}) : super(key: key);

  @override
  _criaAnotacao createState() => _criaAnotacao();
}

class _criaAnotacao extends State<Anotacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calendário'),
        ),
        body: BlocBuilder<CubitDia, Object>(builder: (context, state) {
          return Center(
            child: Column(
              children: const [],
            ),
          );
        }));
  }
}
