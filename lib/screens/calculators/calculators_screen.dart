import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'omlette_volume_screen.dart';
import 'svd_screen.dart';

class CalculatorsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalculatorsScreenState();
}

class _CalculatorsScreenState extends State<CalculatorsScreen> {
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
                  OmletteVolumeScreen(),
                  SVDScreen(),
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
