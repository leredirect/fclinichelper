import 'package:decimal/decimal.dart';
import 'package:fclinick_helper/constants.dart';
import 'package:fclinick_helper/screens/prices/pricelist_analysis_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      if (element.isActive == true) {
        resultServices =
            resultServices + Decimal.parse(element.price.toString());
      }
    });
    analysisBase.forEach((element) {
      if (element.isActive == true) {
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
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          Text(
                            "Результат: ${priceListCalc()}",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                              onPressed: () {
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
