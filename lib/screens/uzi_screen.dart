import 'package:fclinick_helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UziScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UziScreenState();
}

class _UziScreenState extends State<UziScreen> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _cController = TextEditingController();
  FocusNode aNode = FocusNode();
  FocusNode bNode = FocusNode();
  FocusNode cNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double calc() {
      try {
        double a = double.parse(_aController.text);
        double b = double.parse(_bController.text);
        double c = double.parse(_cController.text);
        double res = (a * b * c) * ARINA_CONSTANT;
        return res;
      } on Exception catch (e) {
        return 0;
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
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
                        focusNode: bNode,
                        controller: _bController,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (value) =>
                            FocusScope.of(context).requestFocus(cNode),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        focusNode: cNode,
                        controller: _cController,
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
                Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "x0,52",
                      style: TextStyle(fontSize: 30),
                    ))
              ],
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Результат: ${calc()}",
                  style: TextStyle(fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _aController.dispose();
    _bController.dispose();
    _cController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
