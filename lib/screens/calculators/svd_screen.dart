import 'package:decimal/decimal.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:fclinic_helper/bloc/svd_bloc/svd_bloc.dart';
import 'package:fclinic_helper/bloc/svd_bloc/svd_event.dart';
import 'package:fclinic_helper/bloc/svd_bloc/svd_state.dart';
import 'package:fclinic_helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SVDScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SVDScreenState();
}

class _SVDScreenState extends State<SVDScreen> {
  TextEditingController _aController;
  TextEditingController _bController;
  FocusNode aNode = FocusNode();
  FocusNode bNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Decimal calc() {
      try {
        Decimal a = Decimal.parse(_aController.text.replaceAll(",", "."));
        Decimal b = Decimal.parse(_bController.text.replaceAll(",", "."));
        context.watch<SVDBloc>().add(SVDSaveStateEvent(SVDState(a, b)));
        Decimal res = (a + b) / JAICHKO;
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
                Spacer(),
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10)
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocListener<CleanBloc, CleanState>(
                        listener: (context, state) {
                          if (state.isClean) {
                            _aController.value = TextEditingValue(text: "");
                            _bController.value = TextEditingValue(text: "");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 3,
                                          blurRadius: 4)
                                    ]),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  //enabled: false,
                                  decoration: InputDecoration(
                                    hintText: "мм",
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                      borderSide: BorderSide(
                                          width: 2, color: primaryColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  focusNode: aNode,
                                  controller: _aController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (value) => FocusScope.of(context)
                                      .requestFocus(bNode),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              Container(
                                child: Text(
                                  "+",
                                  style: TextStyle(fontSize: 30),
                                ),
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 3,
                                          blurRadius: 4)
                                    ]),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "мм",
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                      borderSide: BorderSide(
                                          width: 2, color: primaryColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  focusNode: bNode,
                                  controller: _bController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
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
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "÷$JAICHKO",
                            style: TextStyle(fontSize: 30),
                          ))
                    ],
                  ),
                ),
                Spacer(),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(-10, 0),
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        color: Colors.white,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<SVDBloc>().add(
                                    SVDSaveStateEvent(SVDState(null, null)));
                                _aController.value = TextEditingValue(text: "");
                                _bController.value = TextEditingValue(text: "");
                                setState(() {});
                              },
                              icon: Icon(Icons.cancel_outlined,
                                  color: primaryColor),
                            ),
                            Expanded(
                              child: Container(
                                child: BlocListener<CleanBloc, CleanState>(
                                  listener: (context, state) {
                                    if (state.isClean) {
                                      context.read<SVDBloc>().add(
                                          SVDSaveStateEvent(
                                              SVDState(null, null)));
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                    calc() != Decimal.zero
                                        ? "Результат: ${calc()}"
                                        : "Заполните поля",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: calc() != Decimal.zero
                                            ? Colors.black
                                            : Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              enableFeedback: false,
                              onPressed: () {},
                              icon: Icon(Icons.web_asset_off,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
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
    _aController = TextEditingController();
    _bController = TextEditingController();
    _aController.value = TextEditingValue(
        text: context.read<SVDBloc>().state.a == null
            ? ""
            : context.read<SVDBloc>().state.a.toString());
    _bController.value = TextEditingValue(
        text: context.read<SVDBloc>().state.b == null
            ? ""
            : context.read<SVDBloc>().state.b.toString());
  }
}
