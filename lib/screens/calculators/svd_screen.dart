import 'package:decimal/decimal.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_event.dart';
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
        context.watch<SVDBloc>().add(SVDSaveState(SVDState(a, b)));
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
                    BlocListener<CleanBloc, CleanState>(
                      listener: (context, state) { if (state.isClean == true){  _aController.value = TextEditingValue(text: ""); _bController.value = TextEditingValue(text: "");}},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextField(
                                  decoration: InputDecoration(hintText: "мм"),
                                  focusNode: aNode,
                                  controller: _aController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (value) =>
                                      FocusScope.of(context).requestFocus(bNode),
                                  onChanged: (value) {
                                    setState(() {});
                                  }),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextField(
                                decoration: InputDecoration(hintText: "мм"),
                                focusNode: bNode,
                                controller: _bController,
                                keyboardType: TextInputType.number,
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
    _aController = TextEditingController();
    _bController = TextEditingController();
    _aController.value =
        TextEditingValue(text: context.read<SVDBloc>().state.field1==null? "": context.read<SVDBloc>().state.field1.toString());
    _bController.value =
        TextEditingValue(text: context.read<SVDBloc>().state.field2==null? "": context.read<SVDBloc>().state.field2.toString());
  }
}
