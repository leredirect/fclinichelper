import 'package:fclinick_helper/screens/calculators/calculators_screen.dart';
import 'package:fclinick_helper/screens/cycle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/prices/pricelist_screen.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _elements = [
      CalculatorsScreen(),
      CycleScreen(),
      PriceList(),
    ];

    void changeTab(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    Map<int, Color> color = {
      50: Color(0xFFE7E2EC),
      100: Color(0xFFC2B7D0),
      200: Color(0xFF9A88B1),
      300: Color(0xFF725891),
      400: Color(0xFF53347A),
      500: Color(0xFF351062),
      600: Color(0xFF300E5A),
      700: Color(0xFF280C50),
      800: Color(0xFF220946),
      900: Color(0xFF160534),
    };

    MaterialColor primary = new MaterialColor(0xFF351062, color);

    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ru', 'RU'),
        ],
        theme: ThemeData(primarySwatch: primary),
        debugShowCheckedModeBanner: false,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
              ),
              backwardsCompatibility: false,
              // backgroundColor: Color(0xFF351062),
              title: Text("FClinic Helper"),
            ),
            body: Center(
              child: _elements.elementAt(_currentIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Узи",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cached),
                  label: "Цикл",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money),
                  label: "Цена",
                ),
              ],
              backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: changeTab,
            ),
          ),
        ));
  }
}
