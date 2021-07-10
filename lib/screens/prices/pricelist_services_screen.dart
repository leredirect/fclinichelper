import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class PriceListServices extends StatefulWidget {
  final Function updateScreen;

  const PriceListServices({
    Key key,
    this.updateScreen,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PriceListServicesState();
}

class _PriceListServicesState extends State<PriceListServices> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CleanBloc, CleanState>(
      listener: (context, state) {
        if (state.isClean == true) {
          servicesBase.forEach((element) {
            if (element.isActive == true) {
              element.isActive = false;
            }
          });

          analysisBase.forEach((element) {
            if (element.isActive == true) {
              element.isActive = false;
            }
          });
          setState(() {});
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 68,
        ),
        child: ListView.builder(
            itemCount: baseServices.baseList.length,
            itemBuilder: (_, i) {
              return Container(
                padding: i == 0 ? EdgeInsets.only(top: 10) : null,
                child: CheckboxListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(baseServices.baseList[i].name),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${baseServices.baseList[i].price}р.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  value: baseServices.baseList[i].isActive,
                  onChanged: (bool value) {
                    setState(() {
                      baseServices.baseList[i].isActive = value;
                    });
                    widget.updateScreen();
                  },
                ),
              );
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
