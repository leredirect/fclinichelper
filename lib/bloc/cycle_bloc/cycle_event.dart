import 'package:fclinic_helper/bloc/omlette_bloc/omlette_state.dart';

import 'cycle_state.dart';

class CycleEvent {}
class CycleSaveState extends CycleEvent{
  CycleState cycle;

  CycleSaveState(this.cycle);
}