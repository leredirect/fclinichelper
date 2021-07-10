import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_bloc.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_event.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_state.dart';
import 'package:fclinic_helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CycleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CycleScreenState();
}

class _CycleScreenState extends State<CycleScreen> {
  DateTime pickedDate;
  DateTime lastDay = DateTime.now().add(const Duration(days: 0));
  DateTime firstDay = DateTime.now().subtract(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  int result;

  @override
  Widget build(BuildContext context) {
    int pickedDateCalc(DateTime pickedDate) {
      if (pickedDate != null) {
        if (pickedDate.day != DateTime.now().day) {
          DateTimeRange range =
              new DateTimeRange(start: pickedDate, end: DateTime.now());
          result = range.duration.inDays.toInt() + 1;
          context
              .watch<CycleBloc>()
              .add(CycleSaveState(CycleState(result, _selectedDay)));
          return result;
        } else if (pickedDate.day == DateTime.now().day) {
          return 1;
        } else if (context.read<CycleBloc>().state.field1 != null) {
          return context.read<CycleBloc>().state.field1;
        } else {
          return null;
        }
      } else if (context.read<CycleBloc>().state.field1 != null) {
        return context.read<CycleBloc>().state.field1;
      } else {
        return null;
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 20,
                  blurRadius: 20)
            ]),
            padding: EdgeInsets.only(top: 10, bottom: 20),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              firstDay: firstDay,
              lastDay: lastDay,
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.month,
              locale: "ru_RU",
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    pickedDate = selectedDay;
                    _focusedDay = focusedDay;
                    Provider.of<CycleBloc>(context, listen: false)
                        .add(CycleSaveState(CycleState(null, null)));
                    //context.watch<CycleBloc>().add(CycleSaveState(CycleState(null, _selectedDay)));
                  });
                }
              },
              onFormatChanged: (format) {},
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
          Spacer(),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10)
              ]),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      pickedDate = null;
                      _selectedDay = null;
                      Provider.of<CycleBloc>(context, listen: false)
                          .add(CycleSaveState(CycleState(null, null)));
                      result = 0;
                      setState(() {});
                    },
                    icon: Icon(Icons.cancel_outlined, color: primaryColor),
                  ),
                  Expanded(
                    child: Container(
                      child: BlocListener<CleanBloc, CleanState>(
                        listener: (context, state) {
                          if (state.isClean == true) {
                            pickedDate = null;
                            _selectedDay = null;
                            Provider.of<CycleBloc>(context, listen: false)
                                .add(CycleSaveState(CycleState(null, null)));
                            setState(() {});
                          }
                        },
                        child: Text(
                          pickedDateCalc(pickedDate) == null
                              ? "Выберите дату"
                              : "День цикла: ${pickedDateCalc(pickedDate)}",
                          style: TextStyle(
                              fontSize: 25,
                              color: pickedDateCalc(pickedDate) == null
                                  ? Colors.grey
                                  : Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: Icon(Icons.web_asset_off, color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = context.read<CycleBloc>().state.selectedDay == null
        ? DateTime.now()
        : context.read<CycleBloc>().state.selectedDay;
  }
}
