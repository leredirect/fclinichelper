import 'package:decimal/decimal.dart';
import 'package:fclinick_helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SVDScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SVDScreenState();
}

class _SVDScreenState extends State<SVDScreen> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  FocusNode aNode = FocusNode();
  FocusNode bNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Decimal calc() {
      try {
        Decimal a = Decimal.parse(_aController.text.replaceAll(",", "."));
        Decimal b = Decimal.parse(_bController.text.replaceAll(",", "."));
        Decimal res = (a * b) / JAICHKO;
        return res;
      } on Exception catch (e) {
        return Decimal.zero;
      }
    }

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              decoration: InputDecoration(hintText: "мм"),
                              focusNode: aNode,
                              controller: _aController,
                              textInputAction: TextInputAction.next,
                              onSubmitted: (value) =>
                                  FocusScope.of(context).requestFocus(bNode),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              decoration: InputDecoration(hintText: "мм"),
                              focusNode: bNode,
                              controller: _bController,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (value) =>
                                  FocusScope.of(context).unfocus(),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "÷$JAICHKO",
                          style: TextStyle(fontSize: 30),
                        ))
                  ],
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
                      "Результат: ${calc()}",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _aController.dispose();
    _bController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
