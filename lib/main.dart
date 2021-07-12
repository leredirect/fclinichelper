import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_bloc.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_event.dart';
import 'package:fclinic_helper/bloc/cleaner_bloc/clean_state.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_bloc.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_event.dart';
import 'package:fclinic_helper/bloc/cycle_bloc/cycle_state.dart';
import 'package:fclinic_helper/bloc/svd_bloc/svd_bloc.dart';
import 'package:fclinic_helper/constants.dart';
import 'package:fclinic_helper/f_clinic_icons.dart';
import 'package:fclinic_helper/screens/calculators/calculators_screen.dart';
import 'package:fclinic_helper/screens/cycle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'bloc/cycle_bloc/cycle_bloc.dart';
import 'bloc/omlette_bloc/omlette_bloc.dart';
import 'bloc/omlette_bloc/omlette_event.dart';
import 'bloc/omlette_bloc/omlette_state.dart';
import 'bloc/svd_bloc/svd_event.dart';
import 'bloc/svd_bloc/svd_state.dart';
import 'screens/prices/pricelist_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiBlocProvider(
        providers: [
          BlocProvider<SVDBloc>(create: (context) => SVDBloc()),
          BlocProvider<OmletteBloc>(create: (context) => OmletteBloc()),
          BlocProvider<CycleBloc>(create: (context) => CycleBloc()),
          BlocProvider<CleanBloc>(create: (context) => CleanBloc()),
        ],
        child: MaterialApp(
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        )));
  });
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
            if (element.isActive) {
              element.isActive = false;
            }
          });

          analysisBase.forEach((element) {
            if (element.isActive) {
              element.isActive = false;
            }
          });

          context
              .read<CycleBloc>()
              .add(CycleSaveStateEvent(CycleState(null, null)));
          context.read<SVDBloc>().add(SVDSaveStateEvent(SVDState(null, null)));
          context
              .read<OmletteBloc>()
              .add(OmletteSaveStateEvent(OmletteState(null, null, null)));
          context.read<CleanBloc>().add(CleanCleanStateEvent(CleanState(true)));
          break;
      }
    }

    int cnt = 0;
    void counter() {
      cnt = cnt + 1;
    }

    return MaterialApp(
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
              title: SvgPicture.asset(
                'assets/images/title.svg',
                fit: BoxFit.contain,
                width: 42,
                height: 32,
              ),
              //Text("FClinic Helper"),
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
                            transitionBuilder: (context, anim1, anim2, child) {
                              return Opacity(
                                opacity: anim1.value,
                                child: AlertDialog(
                                  backgroundColor: primaryColor,
                                  title: Center(
                                    child: const Text('FCLINIC HELPER',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  content: SingleChildScrollView(
                                    child: Center(
                                      child: ListBody(
                                        children: <Widget>[
                                          Column(
                                            children: [
                                              Text(
                                                'Development:\nMikita Kalinovsky (mikitakalinovsky)\n\nManagement:\nViktar Ščors (kelidon)\n\nTesting & design:\nRina Kulaga',
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                    'assets/images/logo.png',
                                                    fit: BoxFit.contain,
                                                    width: 180,
                                                    height: 70,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  child: Text(
                                                "ver 1.2",
                                                style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.6)),
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Center(
                                      child: TextButton(
                                        child: Text('Назад',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            transitionDuration: Duration(milliseconds: 200));
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
            body: PageTransitionSwitcher(
              transitionBuilder:
                  (child, primaryAnimation, secondaryAnimation) =>
                      FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
              child: _elements.elementAt(_currentIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: RotatedBox(
                      quarterTurns: 2, child: Icon(FClinic.uzzi, size: 27)),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cached, size: 27),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt, size: 27),
                  label: "",
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
