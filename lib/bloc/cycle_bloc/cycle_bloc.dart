import 'package:flutter_bloc/flutter_bloc.dart';

import 'cycle_event.dart';
import 'cycle_state.dart';


class CycleBloc extends Bloc<CycleEvent, CycleState> {
  CycleBloc() : super(CycleState(null));

  @override
  Stream<CycleState> mapEventToState(event) async*{
    if(event is CycleSaveState){
      yield event.cycle;
    }
  }
}