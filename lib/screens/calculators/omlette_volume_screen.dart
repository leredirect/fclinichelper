import 'package:decimal/decimal.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:fclinic_helper/bloc/omlette_bloc/omlette_bloc.dart';
import 'package:fclinic_helper/bloc/omlette_bloc/omlette_event.dart';
import 'package:fclinic_helper/bloc/omlette_bloc/omlette_state.dart';
import 'package:fclinic_helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OmletteVolumeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OmletteVolumeScreenState();
}

class _OmletteVolumeScreenState extends State<OmletteVolumeScreen> {
  TextEditingController _aController;
  TextEditingController _bController;
  TextEditingController _cController;
  FocusNode aNode = FocusNode();
  FocusNode bNode = FocusNode();
  FocusNode cNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Decimal calc() {
      try {
        Decimal a = Decimal.parse(_aController.text.replaceAll(",", "."));
        Decimal b = Decimal.parse(_bController.text.replaceAll(",", "."));
        Decimal c = Decimal.parse(_cController.text.replaceAll(",", "."));
        context.watch<OmletteBloc>().add(OmletteSaveState(OmletteState(a, b, c)));
        Decimal res = (a * b * c) * ARINA_CONSTANT;
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
                      listener: (context, state) { if (state.isClean == true){  _aController.value = TextEditingValue(text: ""); _bController.value = TextEditingValue(text: ""); _cController.value = TextEditingValue(text: "");}},
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
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: TextField(
                                decoration: InputDecoration(hintText: "мм"),
                                focusNode: bNode,
                                controller: _bController,
                                keyboardType: TextInputType.number,
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
                                decoration: InputDecoration(hintText: "мм"),
                                focusNode: cNode,
                                controller: _cController,
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
                          "x$ARINA_CONSTANT",
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
    _cController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _aController = TextEditingController();
    _bController = TextEditingController();
    _cController = TextEditingController();
    _aController.value =
        TextEditingValue(text: context.read<OmletteBloc>().state.field1==null? "": context.read<OmletteBloc>().state.field1.toString());
    _bController.value =
        TextEditingValue(text: context.read<OmletteBloc>().state.field2==null? "": context.read<OmletteBloc>().state.field2.toString());
    _cController.value =
        TextEditingValue(text: context.read<OmletteBloc>().state.field3==null? "": context.read<OmletteBloc>().state.field3.toString());
  }
}
