import '../cycle_bloc/cycle_state.dart';

class CycleEvent {}

class CycleSaveStateEvent extends CycleEvent {
  CycleState cycle;

  CycleSaveStateEvent(this.cycle);
}
