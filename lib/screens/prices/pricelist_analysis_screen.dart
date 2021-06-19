import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class PriceListAnalysis extends StatefulWidget {
  final Function updateScreen;

  const PriceListAnalysis({Key key, this.updateScreen}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PriceListAnalysisState();
}

class _PriceListAnalysisState extends State<PriceListAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          bottom: 87,
        ),
        child: ListView.builder(
            itemCount: baseAnalysis.baseList.length,
            itemBuilder: (_, i) {
              return Container(
                padding: i == 0 ? EdgeInsets.only(top: 10, bottom: 10) : null,
                color: i == 0 ? Colors.grey[200] : Colors.white,
                child: CheckboxListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${baseAnalysis.baseList[i].name}"),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "${baseAnalysis.baseList[i].price}р.",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(" ${baseAnalysis.baseList[i].anal}",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  value: baseAnalysis.baseList[i].isActive,
                  onChanged: (bool value) {
                    setState(() {
                      baseAnalysis.baseList[i].isActive = value;
                    });
                    widget.updateScreen();
                  },
                ),
              );
            }));
  }

  @override
  void initState() {
    super.initState();
  }
}
