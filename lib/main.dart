import 'package:flutter/material.dart';

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
      Text("1"),
      Text("2"),
      Text("3"),
    ];

    void changeTab(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
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
          currentIndex: _currentIndex,
          onTap: changeTab,
        ),
      ),
    );
  }
}
