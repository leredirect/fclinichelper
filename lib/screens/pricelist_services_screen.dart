import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PriceListServices extends StatefulWidget {
  final Function updateScreen;

  const PriceListServices({Key key, this.updateScreen}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PriceListServicesState();
}

class _PriceListServicesState extends State<PriceListServices> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: baseServices.baseList.length,
        itemBuilder: (_, i) {
          return CheckboxListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(baseServices.baseList[i].name),
                Text("${baseServices.baseList[i].price}"),
              ],
            ),
            value: baseServices.baseList[i].isActive,
            onChanged: (bool value) {
              setState(() {
                baseServices.baseList[i].isActive = value;
              });
              widget.updateScreen();
            },
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }
}
