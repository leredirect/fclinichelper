import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_event.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:fclinic_helper/bloc/svd_bloc/svd_bloc.dart';
import 'package:fclinic_helper/constants.dart';
import 'package:fclinic_helper/screens/calculators/calculators_screen.dart';
import 'package:fclinic_helper/screens/cycle_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_bloc.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_event.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_state.dart';
import 'package:provider/provider.dart';
import 'bloc/cycle_bloc/cycle_bloc.dart';
import 'bloc/omlette_bloc/omlette_bloc.dart';
import 'bloc/omlette_bloc/omlette_event.dart';
import 'bloc/omlette_bloc/omlette_state.dart';
import 'bloc/svd_bloc/svd_event.dart';
import 'bloc/svd_bloc/svd_state.dart';
import 'screens/prices/pricelist_screen.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<SVDBloc>(create: (context) => SVDBloc()),
        BlocProvider<OmletteBloc>(create: (context) => OmletteBloc()),
        BlocProvider<CycleBloc>(create: (context) => CycleBloc()),
        BlocProvider<CleanBloc>(create: (context) => CleanBloc()),
      ],
      child:MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  )));
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

    void handleClick(String value) {
      switch (value) {
        case 'Сбросить все':
            servicesBase.forEach((element) {
              if (element.isActive == true) {
                element.isActive = false;
              }
            });

            analysisBase.forEach((element) {
              if (element.isActive == true) {
                element.isActive = false;
              }
            });

            Provider.of<CycleBloc>(context, listen: false).add(CycleSaveState(CycleState(null)));
          Provider.of<SVDBloc>(context, listen: false).add(SVDSaveState(SVDState(null, null)));
          Provider.of<OmletteBloc>(context, listen: false).add(OmletteSaveState(OmletteState(null, null, null)));
          Provider.of<CleanBloc>(context, listen: false).add(CleanCleanState(CleanState(true)));
          break;
      }
    }

    int cnt = 0;
    void counter() {
      cnt = cnt + 1;
    }

    return  MaterialApp(
            localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
            supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ru', 'RU'),
        ],
            theme: ThemeData(primarySwatch: primaryColorM),
            debugShowCheckedModeBanner: false,
            home: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backwardsCompatibility: false,
                  title: Text("FClinic Helper"),
                  actions: [
                    Visibility(
                      maintainState: true,
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainInteractivity: true,
                      visible: false,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onLongPress: () {
                          if (cnt == 3) {
                            counter();
                            showGeneralDialog(
                                context: context,
                                pageBuilder: (context, anim1, anim2) {},
                                barrierDismissible: true,
                                barrierLabel: "",
                                transitionBuilder:
                                    (context, anim1, anim2, child) {
                                  return Opacity(
                                    opacity: anim1.value,
                                    child: AlertDialog(
                                      backgroundColor: primaryColor,
                                      title: const Text('FCLINIC HELPER',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Column(
                                              children: [
                                                Text(
                                                    'Development:\nMikita Kalinovsky (mikitakalinovsky)\n\nManagement:\nViktar Ščors (kelidon)\n\nTesting & design:\nRina Kulaga',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "©2021, GatovoLabs",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Назад',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                transitionDuration:
                                    Duration(milliseconds: 200));
                          } else {}
                        },
                        onPressed: () {
                          counter();
                        },
                        child: null,
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: handleClick,
                      itemBuilder: (BuildContext context) {
                        return {'Сбросить все'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
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
