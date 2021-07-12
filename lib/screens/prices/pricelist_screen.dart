import 'package:decimal/decimal.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:fclinic_helper/constants.dart';
import 'package:fclinic_helper/screens/prices/pricelist_analysis_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pricelist_services_screen.dart';

class PriceList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  Decimal priceListCalc() {
    Decimal resultServices = Decimal.parse("0.0");
    Decimal resultAnalysis = Decimal.parse("0.0");
    servicesBase.forEach((element) {
      if (element.isActive) {
        resultServices =
            resultServices + Decimal.parse(element.price.toString());
      }
    });
    analysisBase.forEach((element) {
      if (element.isActive) {
        resultAnalysis =
            resultAnalysis + Decimal.parse(element.price.toString());
      }
    });
    return resultServices + resultAnalysis;
  }

  void updateScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: primaryColorM[600],
            toolbarHeight: 50,
            title: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: baseServices.name,
                ),
                Tab(
                  text: baseAnalysis.name,
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                children: [
                  PriceListServices(updateScreen: updateScreen),
                  PriceListAnalysis(updateScreen: updateScreen),
                ],
              ),
              Column(
                children: [
                  Spacer(),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10)
                          ]),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              servicesBase.forEach((element) {
                                if (element.isActive) {
                                  element.isActive = false;
                                }
                              });

                              analysisBase.forEach((element) {
                                if (element.isActive) {
                                  element.isActive = false;
                                }
                              });
                              setState(() {});
                              priceListCalc();
                            },
                            icon: Icon(Icons.cancel_outlined,
                                color: primaryColor),
                          ),
                          Expanded(
                            child: Container(
                              child: BlocListener<CleanBloc, CleanState>(
                                listener: (context, state) {
                                  if (state.isClean) {
                                    servicesBase.forEach((element) {
                                      if (element.isActive) {
                                        element.isActive = false;
                                      }
                                    });

                                    analysisBase.forEach((element) {
                                      if (element.isActive) {
                                        element.isActive = false;
                                      }
                                    });
                                    priceListCalc();
                                    setState(() {});
                                  }
                                },
                                child: Text(
                                  priceListCalc() == Decimal.zero
                                      ? "Выберите услугу"
                                      : "Стоимость: ${priceListCalc()}р.",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: priceListCalc() == Decimal.zero
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
                            icon:
                                Icon(Icons.web_asset_off, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
