import 'package:fclinick_helper/screens/omlette_volume_screen.dart';
import 'package:fclinick_helper/screens/svd_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UziScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UziScreenState();
}

class _UziScreenState extends State<UziScreen> {
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
                  text: "Объем яичника",
                ),
                Tab(
                  text: "СВД",
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                children: [
                  SVDScreen(),
                  OmletteVolumeScreen(),
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
