import '../cycle_bloc/cycle_state.dart';

class CycleEvent {}

class CycleSaveState extends CycleEvent {
  CycleState cycle;

  CycleSaveState(this.cycle);
}
