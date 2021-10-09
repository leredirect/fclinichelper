import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:fclinic_helper/bloc/ticker_bloc/ticker_bloc.dart';
import 'package:fclinic_helper/bloc/ticker_bloc/ticker_event.dart';
import 'package:fclinic_helper/bloc/ticker_bloc/ticker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_range_picker/time_range_picker.dart';

class TickerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TickerScreenState();
}

class _TickerScreenState extends State<TickerScreen> {
  TimeOfDay start = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay end = TimeOfDay(hour: 1, minute: 0);

  List<ClockLabel> listOfLabels() {
    List<ClockLabel> result = [];
    for (int i = 0; i < 24; i++) {
      result.add(
        ClockLabel.fromTime(time: TimeOfDay(hour: i, minute: 0), text: "$i"),
      );
    }
    return result;
  }

  TimeOfDay calc() {
    try {
      int hours = start.hour - end.hour;
      int minutes = start.minute - end.minute;
      TimeOfDay result = new TimeOfDay(hour: hours, minute: minutes);
      // context.watch<TickerBloc>().add(TickerSaveStateEvent(TickerState(result)));
      return result;
    } on Exception catch (e) {
      return TimeOfDay.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        Spacer(),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10)
            ]),
            child: TimeRangePicker(
              maxDuration: Duration(hours: 23, minutes: 59),
              onEndChange: (endResult) {
                setState(() {
                  end = endResult;
                });
              },
              onStartChange: (startResult) {
                setState(() {
                  start = startResult;
                });
              },
              handlerRadius: 5,
              labels: listOfLabels(),
              end: end,
              start: start,
              ticks: 24,
              clockRotation: 180,
              fromText: "Начало",
              toText: "Конец",
              hideButtons: true,
            )),
        Spacer(),
        Center(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(-10, 0),
                      spreadRadius: 5,
                      blurRadius: 10)
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.web_asset_off, color: Colors.white),
                    ),
                    Expanded(
                      child: Container(
                        child: BlocListener<CleanBloc, CleanState>(
                          listener: (context, state) {
                            if (state.isClean) {
                              context.read<TickerBloc>().add(
                                  TickerSaveStateEvent(
                                      TickerState(null, null)));
                              setState(() {});
                            }
                          },
                          child: Text(
                            context.read<TickerBloc>().state == null
                                ? "Задайте интервал"
                                : "Результат: ${calc().hour.abs()}ч. ${calc().minute == 0 ? "" : ": ${calc().minute.abs()}м."}",
                            style: TextStyle(fontSize: 25, color: Colors.black),
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
            ],
          ),
        ),
      ]),
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}
