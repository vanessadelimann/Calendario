import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:calendario/modelos/cubitDia.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'anotacao.dart';

class MeuCalendario extends StatefulWidget {
  const MeuCalendario({Key? key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class DiaProvider extends StatelessWidget {
  const DiaProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CubitDia(),
      child: const MeuCalendario(),
    );
  }
}

class _CalendarioState extends State<MeuCalendario> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2050, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                context.read<CubitDia>().diaPressionado(selectedDay);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<CubitDia>(context),
                        child: const Anotacao()),
                  ),
                );
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        ],
      ),
    );
  }
}
