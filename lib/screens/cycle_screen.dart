import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CycleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CycleScreenState();
}

class _CycleScreenState extends State<CycleScreen> {
  DateTime pickedDate;

  @override
  Widget build(BuildContext context) {
    int pickedDateCalc(DateTime pickedDate) {
      if (pickedDate != null) {
        DateTimeRange range =
            new DateTimeRange(start: pickedDate, end: DateTime.now());
        int result = range.duration.inDays.toInt();
        return result + 1;
      } else {
        return 0;
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
                    var firstDate = now.subtract(const Duration(days: 5));
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
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10)
              ]),
              child: Text(
                pickedDate == null
                    ? "Выберите дату"
                    : "День цикла: ${pickedDateCalc(pickedDate)}",
                style: TextStyle(
                    fontSize: 25,
                    color: pickedDate == null ? Colors.grey : Colors.black),
                textAlign: TextAlign.center,
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
  }
}
