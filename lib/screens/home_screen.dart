import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(

            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.calendar_today_outlined)),
                Tab(icon: Icon(Icons.account_box))
              ],
            ),
            title: Text("FClinic Helper"),

          ),
          body: TabBarView(
            children: [
              Center(child: Text("Календарь")),
              Center(child: Text("База")),
            ],
          ),
        ),
      ),
    );
  }
}