import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_bloc.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_event.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CycleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CycleScreenState();
}

class _CycleScreenState extends State<CycleScreen> {
  DateTime pickedDate;

  int result;


  @override
  Widget build(BuildContext context) {
    int pickedDateCalc(DateTime pickedDate) {
      if (pickedDate != null) {
        DateTimeRange range =
            new DateTimeRange(start: pickedDate, end: DateTime.now());
        result = range.duration.inDays.toInt();
        context.watch<CycleBloc>().add(CycleSaveState(CycleState(result)));
        return result;
      } else if(context.read<CycleBloc>().state.field1 != null){
        return context.read<CycleBloc>().state.field1;
      }
      else {
        return null;
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35),
              child: TextButton(
                  onPressed: () {
                    DateTime now = DateTime.now();
                    var lastDate = now.add(const Duration(days: 0));
                    showDatePicker(
                      locale: Locale("ru", "RU"),
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: lastDate,
                    ).then((value) => pickedDate = value).then(
                      (value) {
                        setState(() {});
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF351062),
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 40,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Center(
                        child: Text(
                      "Выбрать день",
                      style: TextStyle(color: Colors.white),
                    )),
                  )),
            ),
          ),
          Spacer(),
          BlocListener<CleanBloc, CleanState>(
            listener: (context, state) {
              if (state.isClean == true) {
                result = null;
              }
            },
            child:  Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10)
                ]),
                child: Column(
                  children: [
                    Text(
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
                    TextButton(
                        onPressed: () {
                          pickedDate = null;
                          Provider.of<CycleBloc>(context, listen: false)
                              .add(CycleSaveState(CycleState(null)));
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF351062),
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 30,
                          child: Center(
                              child: Text(
                            "Сбросить",
                            style: TextStyle(color: Colors.white),
                          )),
                        ))
                  ],
                ),
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
    result = context.read<CycleBloc>().state.field1;
  }
}
