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
    Color pickedDateColor(DateTime pickedDate) {
      if (pickedDate == null) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }

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
            child: InkWell(
                onTap: () {
                  DateTime now = DateTime.now();
                  var lastDate = now.add(const Duration(days: 60));
                  var firstDate = now.subtract(const Duration(days: 5));
                  showDatePicker(
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
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35),
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
                    color: Colors.purple,
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
          Spacer(),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "День цикла: ${pickedDateCalc(pickedDate)}",
                style:
                    TextStyle(color: pickedDateColor(pickedDate), fontSize: 25),
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
