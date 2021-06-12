import 'package:decimal/decimal.dart';
import 'package:fclinick_helper/constants.dart';
import 'package:fclinick_helper/screens/pricelist_analysis_screen.dart';
import 'package:fclinick_helper/screens/pricelist_services_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            toolbarHeight: 50,
            title: TabBar(
              tabs: [
                Tab(
                  text: "Услуги",
                ),
                Tab(
                  text: "Анализы",
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
                            child: Text("Сбросить"),
                          )
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
