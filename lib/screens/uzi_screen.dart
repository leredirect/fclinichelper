import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UziScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                // width: MediaQuery.of(context).size.width*0.5,
                child: TextField(
                ),
              ),
              Container(
                child: TextField(
                ),
              ),
              Container(
                child: TextField(
                ),
              ),
              Container(
              ),
              Container(
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: Container(

                    color: Colors.green, child: Text("x0,52")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
